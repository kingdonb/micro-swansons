class Table < ApplicationRecord
  class TableError < StandardError; end

  class NotAuthorizedAsWaiter < TableError; end
  class RecoverableTableError < StandardError; end
  class ErrEatingWithoutBothForks < TableError; end
  class ErrMissingForkOnTable < TableError; end

  class NoSeatsLeft < TableError; end
  class AlreadySeated < RecoverableTableError; end
  class ErrWaitForEveryone < RecoverableTableError; end

  include SeatSemaphore
  include TableDecorator

  has_many :forks, dependent: :destroy

  def eat!(client_ip:)
    with_lock do
      unless client_has_both_forks?(client_ip: client_ip)
        Rails.logger.warn("Table::ErrEatingWithoutBothForks: #{client_ip} tried to eat, but didn't have two forks at #{table_deco}.")
        raise Table::ErrEatingWithoutBothForks
      else
        Rails.logger.info("Client at: #{client_ip} is eating at #{table_deco}.")
      end

      self
    end
  end

  def be_seated!(client_ip:)
    with_lock do
      decrement_seats!(client_ip: client_ip)
      position = clients.count
      f = forks.find_by(position: position)
      unless f.present?
        f = forks.build
        f.position = position
        f.clean = false
        f.save!
      end

      self
    end
  end

  def what_fork_is_left_of(client_ip:)
    find_fork_to_left_of(client_ip: client_ip)
  end

  def what_fork_is_right_of(client_ip:)
    find_fork_to_right_of(client_ip: client_ip)
  end

  def has_fork?(client_ip:, fork:)
    if fork.owner_ip == client_ip
      true
    else
      false
    end
  end

  def verify_all_seated?
    seats == 0
  end

  def client_has_both_forks?(client_ip:)
    raise Table::ErrWaitForEveryone unless verify_all_seated?

    left_fork = find_fork_to_left_of(client_ip: client_ip)
    right_fork = find_fork_to_right_of(client_ip: client_ip)

    unless left_fork.present? && right_fork.present?
      raise Table::ErrMissingForkOnTable
    else
      if has_fork?(client_ip: client_ip, fork: left_fork) &&
          has_fork?(client_ip: client_ip, fork: right_fork)
        Rails.logger.info("Client at: #{client_ip} observed with two forks at #{table_deco}.")
        true
      else
        false
      end
    end

  rescue Table::ErrWaitForEveryone => e
    Rails.logger.
      warn("Table::ErrWaitForEveryone: Client at: #{client_ip} can't have his "\
           "neighbor's fork, #{table_deco} still has empty seats to fill yet.")
    false
  end

  def my_position(client_ip:)
    clients.index(client_ip) + 1
  end

  def position_to_my_right(client_ip:)
    my_zero_index = clients.index(client_ip)
    if my_zero_index == 0
      clients.length
    else
      my_zero_index
    end
  end

  def find_fork_to_left_of(client_ip:)
    forks.
      find_by!(
        position: my_position(
          client_ip: client_ip)
    )
  rescue ActiveRecord::RecordNotFound => e
    raise ErrMissingForkOnTable,
      "Table::ErrMissingForkOnTable: Client at: #{client_ip} "\
      "seems to be seated without a fork of his own, at #{table_deco}."
  end

  def find_fork_to_right_of(client_ip:)
    if verify_all_seated?
      num_seats = clients.length
      forks.
        find_by!(
          position: position_to_my_right(
            client_ip: client_ip)
      )
    else
      raise ErrWaitForEveryone
    end
  end

  # validate fork count > 1
end

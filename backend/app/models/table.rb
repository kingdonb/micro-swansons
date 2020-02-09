class Table < ApplicationRecord
  class TableError < StandardError; end
  class NoSeatsLeft < TableError; end
  has_many :forks

  def decrement_seats!
    if seats > 0
      self.transaction do
        self.seats = seats - 1
        # Waiter TODO: record the IP address of the Ron who just sat down,
        # and ensure that he receives a dirty fork with his number on it
        # NB: the table will store this and play matchmaker for Chandy-Misra
        save!
      end
    else
      raise NoSeatsLeft
    end
  end

  # validate fork count > 1
end

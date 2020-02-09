class Table < ApplicationRecord
  class TableError < StandardError; end

  class NotAuthorizedAsWaiter < TableError; end
  class RecoverableTableError < StandardError; end
  class ErrEatingWithoutBothForks < TableError; end

  class NoSeatsLeft < TableError; end
  class AlreadySeated < RecoverableTableError; end

  include SeatSemaphore
  include TableDecorator

  has_many :forks, dependent: :destroy

  def eat!(client_ip:)
    raise Table::ErrEatingWithoutBothForks
  end

  # validate fork count > 1
end

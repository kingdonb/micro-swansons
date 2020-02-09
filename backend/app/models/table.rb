class Table < ApplicationRecord
  class TableError < StandardError; end

  class NotAuthorizedAsWaiter < TableError; end
  class RecoverableTableError < StandardError; end

  class NoSeatsLeft < TableError; end
  class AlreadySeated < RecoverableTableError; end

  include SeatSemaphore
  include TableDecorator

  has_many :forks, dependent: :destroy

  # validate fork count > 1
end

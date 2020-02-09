class Table < ApplicationRecord
  class TableError < StandardError; end

  class NotAuthorizedAsWaiter < TableError; end
  class RecoverableTableError < StandardError; end

  class NoSeatsLeft < TableError; end
  class AlreadySeated < RecoverableTableError; end

  include SeatSemaphore

  has_many :forks, dependent: :destroy

  def table_deco
    "#{name} (##{table_id})"
  end

  # validate fork count > 1
end

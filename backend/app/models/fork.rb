class Fork < ApplicationRecord
  belongs_to :table
  validates :position, numericality: {greater_than: 0}

  def fork_deco
    "#{table.table_deco}: Fork #{position} (##{id})"
  end
end

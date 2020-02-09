class Fork < ApplicationRecord
  belongs_to :table
  validates :position, numericality: {greater_than: 0}
end

class Table < ApplicationRecord
  has_many :forks

  # validate fork count > 1
end

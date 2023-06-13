class Review < ApplicationRecord
  belongs_to :order
  has_one :van, through: :order
  has_one :customer, through: :order
end

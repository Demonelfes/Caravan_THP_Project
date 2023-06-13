class Order < ApplicationRecord
  has_one :review
  belongs_to :van
  belongs_to :customer, class_name: "User"
end

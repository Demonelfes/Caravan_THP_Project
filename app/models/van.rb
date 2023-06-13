class Van < ApplicationRecord
  belongs_to :user, optional: true
  has_many :orders
  has_many :reviews, through: :orders
  has_many :join_van_tags
  has_many :tags, through: :join_van_tags
  has_many :customers, through: :orders

end

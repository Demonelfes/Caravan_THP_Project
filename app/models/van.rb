class Van < ApplicationRecord
  belongs_to :user, optional: true
  has_many :rentals
  has_many :orders, through: :rentals
  has_many :reviews, through: :orders
  has_many :join_van_tags
  has_many :tags, through: :join_van_tags
  has_many :customers, through: :orders
  has_many :rentals
  has_one_attached :photo

end

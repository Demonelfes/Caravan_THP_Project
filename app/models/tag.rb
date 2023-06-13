class Tag < ApplicationRecord
  has_many :join_van_tags
  has_many :vans, through: :join_van_tags
end

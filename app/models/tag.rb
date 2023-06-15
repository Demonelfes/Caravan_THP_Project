class Tag < ApplicationRecord
  validates :title, presence: true, length: { in: 3..20, message: "-Le tag doit avoir une longueur comprise entre 3 caractères et 20 caractères." }

  has_many :join_van_tags
  has_many :vans, through: :join_van_tags
end

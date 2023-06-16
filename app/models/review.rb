class Review < ApplicationRecord
  validates :order_id, presence: true
  validates :content, presence: true, length: { in: 6..20, message: "-Le contenu de votre avis doit avoir une longueur comprise entre 6 caractères et 20 caractères." }
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5, message:"-La notation doit être comprise entre 0 et 5." }

  belongs_to :order
  has_one :van, through: :order
  has_one :customer, through: :order
end

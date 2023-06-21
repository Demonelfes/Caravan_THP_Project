class Van < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates :title, presence: true, length: { in: 6..20, message: "-Le titre doit avoir une longueur comprise entre 6 caractères et 20 caractères." }
  validates :description, presence: true, length: { in: 20..250, message: "-La description doit avoir une longueur comprise entre 20 caractères et 250 caractères." }
  validates :city, presence: true
  validates :brand, presence: true, length: { in: 2..20, message: "-La marque doit avoir une longueur comprise entre 2 caractères et 20 caractères." }
  validates :registration, presence: true, format: { with: /\A[A-Z]{2}-\d{3}-[A-Z]{2}\z|\A\d{3}-[A-Z]{3}-\d{2}\z/, message:"-La plaque d'immatriculation entrée ne correspond pas au format de plaque d'immatriculation française."}
  validates :year, presence: true, numericality: { greater_than_or_equal_to: 1940, less_than_or_equal_to: Date.current.year , message:"-L'année de mise en service de votre véhicule doit être comprise entre 1940 et aujourd'hui." }
  validates :energy, presence: true, length: { in: 2..20, message: "-Le carburant doit avoir une longueur comprise entre 2 caractères et 20 caractères." }
  validates :bed_number, presence: true
  validates :price_per_day, presence: true, numericality: { greater_than: 0, message: "-Le prix ne peut pas être nul - Merci d'entrer un nouveau prix." }
  validates :user_id, presence: true


  belongs_to :user, optional: true
  has_many :rentals
  has_many :orders, through: :rentals
  has_many :reviews, through: :orders
  has_many :join_van_tags
  has_many :tags, through: :join_van_tags
  has_many :customers, through: :orders
  has_one_attached :photo
  has_many :rentals
end

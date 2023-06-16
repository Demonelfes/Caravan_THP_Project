class User < ApplicationRecord
  after_create :welcome_send

  has_many :vans
  has_many :rentals
  has_many :taken_rentals, foreign_key: 'customer_id', class_name: "Rental"
  has_many :given_rentals, foreign_key: 'owner_id', class_name: "Rental"

  #has_many :reviews, foreign_key: 'customer_id', class_name: "Order" #Laurie

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def welcome_send
   UserMailer.welcome_email(self).deliver_now
  end
end

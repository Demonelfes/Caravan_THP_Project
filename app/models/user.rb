class User < ApplicationRecord
  has_many :vans
  has_many :rental_taken, foreign_key: 'customer_id', class_name: "Order"
  has_many :rental_given, foreign_key: 'owner_id', class_name: "Order"
  #Reviews de classe Order? Plutot reviews de classe Review, non? 
  #Laurie : c'est correct, c'est la foreign key qui est de  class Order
  has_many :reviews, foreign_key: 'customer_id', class_name: "Order"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

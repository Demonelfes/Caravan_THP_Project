class User < ApplicationRecord
  has_many :vans
  has_many :orders_bought_vans, foreign_key: 'customer_id', class_name: "Order"
  has_many :orders_sold_vans, foreign_key: 'owner_id', class_name: "Order"
  has_many :reviews, foreign_key: 'customer_id', class_name: "Order"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

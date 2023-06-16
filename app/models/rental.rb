class Rental < ApplicationRecord
  validates :start_date, presence: true, comparison: { greater_than_or_equal_to: DateTime.now , message: "-Merci de choisir une date dans le futur" }
  validates :end_date, presence: true, comparison: { greater_than: :start_date, message: "-La date de retour de la location doit être ultérieure à la date de début de location." }
  
  validate :duplicate_rental
  validates :total_price, presence: true
  validates :owner_id, presence: true
  validates :customer_id, presence: true
  validates :van_id, presence: true

  has_one :order
  belongs_to :van
  belongs_to :customer, class_name: "User"
  belongs_to :owner, class_name: "User"


  private

  def duplicate_rental
    if self.start_date != nil && self.end_date != nil
      Order.all.each do |order|
        if self.van_id == order.van_id
          if self.start_date <= order.end_date && self.start_date >= order.start_date || self.end_date <= order.end_date && self.end_date >= order.start_date
            return errors.add(:base, "-Cette période n'est pas disponible.")
          end
        end
      end 
    end
  end
end

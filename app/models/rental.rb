class Rental < ApplicationRecord
  validates :end_date, comparison: { greater_than: :start_date }
  validate :duplicate_rental

  validates :start_date, presence: true
  validates :end_date, presence: true
  private


  def duplicate_rental
    Rental.all.each do |rental|
        if rental.id != self.id
          if rental.van_id == self.van_id
            if self.start_date <= rental.end_date && self.start_date >= rental.start_date || self.end_date <= rental.end_date && self.end_date >= rental.start_date
              return errors.add(:base, "Duplicate rental detected.")
            end
          end
        end
    end


  end
end

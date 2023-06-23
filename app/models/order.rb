class Order < ApplicationRecord
  after_create :order_confirmation_to_customer_send, :order_confirmation_to_owner_send, :admin_order_confirmation_van_private_send, :admin_order_confirmation_van_pro_send

  validates :rental_id, presence: true

  belongs_to :rental
  has_one :van, through: :rental
  has_one :customer, through: :rental
  has_one :owner, through: :rental

  delegate :start_date, to: :rental, prefix: false
  delegate :end_date, to: :rental, prefix: false
  delegate :total_price, to: :rental, prefix: false
  delegate :customer_id, to: :rental, prefix: false
  delegate :owner_id, to: :rental, prefix: false
  delegate :van_id, to: :rental, prefix: false

  def order_confirmation_to_customer_send
    UserMailer.order_confirmation_to_customer_email(self).deliver_now
  end

  def order_confirmation_to_owner_send
    if self.van.is_van_pro == false
      UserMailer.order_confirmation_to_owner_email(self).deliver_now
    end
  end

  def admin_order_confirmation_van_private_send
    if self.van.is_van_pro == false
      AdminMailer.admin_order_confirmation_van_private_email(self).deliver_now
    end
  end

  def admin_order_confirmation_van_pro_send
    if self.van.is_van_pro == true
      AdminMailer.admin_order_confirmation_van_pro_email(self).deliver_now
    end
  end
end

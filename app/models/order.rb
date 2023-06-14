class Order < ApplicationRecord
  after_create :order_confirmation_to_customer_send, :order_confirmation_to_owner_send, :admin_order_confirmation_van_private_send, :admin_order_confirmation_van_pro_send

  has_one :review
  belongs_to :van
  belongs_to :customer, class_name: "User"
  has_one :user, through: :van

  def order_confirmation_to_customer_send
    UserMailer.order_confirmation_to_customer_email(self.user, self).deliver_now
  end

  def order_confirmation_to_owner_send
    if self.van.is_van_pro == false
      UserMailer.order_confirmation_to_owner_email(self.user, self).deliver_now
    end 
  end

  def admin_order_confirmation_van_private_send
    if self.van.is_van_pro == false
      AdminMailer.admin_order_confirmation_van_private_email(self.user, self).deliver_now
    end 
  end 

  def admin_order_confirmation_van_pro_send
    if self.van.is_van_pro == true
      AdminMailer.admin_order_confirmation_van_pro_email(self.user, self).deliver_now
    end 
  end 
end

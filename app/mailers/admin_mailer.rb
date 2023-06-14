class AdminMailer < ApplicationMailer
  default from: 'cara_van_ink@proton.me'


  def admin_order_confirmation_van_pro_email(user, order)
    @order = order
    @admin = 'cara_van_ink@proton.me'

    mail(to: @admin, subject: 'Nouvelle réservation sur votre van')
  end

  def admin_order_confirmation_van_private_email(user, order)
    @order = order
    @admin = 'cara_van_ink@proton.me'

    mail(to: @admin, subject: 'Nouvelle réservation sur votre van')
  end
end

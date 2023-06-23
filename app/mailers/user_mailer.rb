class UserMailer < ApplicationMailer
  default from: 'cara_van_ink@proton.me'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def order_confirmation_to_owner_email(order)
    @order = order
    @user = order.owner

    mail(to: @user.email, subject: 'Nouvelle réservation sur votre van')
  end

  def order_confirmation_to_customer_email(order)
    @order = order
    @user = order.customer

    mail(to: @user.email, subject: 'Merci pour votre réservation !')
  end
end

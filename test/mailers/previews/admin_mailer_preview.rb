# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/order_confirmation_email
  def order_confirmation_email
    AdminMailer.order_confirmation_email
  end

end

require "test_helper"

class AdminMailerTest < ActionMailer::TestCase
  test "order_confirmation_email" do
    mail = AdminMailer.order_confirmation_email
    assert_equal "Order confirmation email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

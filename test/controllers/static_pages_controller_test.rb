require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get company" do
    get static_pages_company_url
    assert_response :success
  end

  test "should get team" do
    get static_pages_team_url
    assert_response :success
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
  end

  test "should get faq" do
    get static_pages_faq_url
    assert_response :success
  end
end

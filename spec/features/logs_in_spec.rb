require 'rails_helper'

RSpec.describe "User logs in", type: :feature do
  scenario "User logs in successfully" do
    user = User.create(email: 'user@example.com', password: 'password')

    visit new_user_session_path

    fill_in 'user_email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    click_button "Se connecter"

    expect(page).to have_content 'Déconnexion'
  end
end
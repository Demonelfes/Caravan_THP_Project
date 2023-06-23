require 'rails_helper'

RSpec.describe "User logs out", type: :feature do
  scenario "User logs out successfully" do
    user = User.create(email: 'user@example.com', password: 'password')

    visit new_user_session_path

    fill_in 'user_email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    click_button "Se connecter"

    click_link "Déconnexion"

    expect(page).to have_content 'Connexion'
  end
end
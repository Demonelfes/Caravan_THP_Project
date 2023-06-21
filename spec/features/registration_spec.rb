require 'rails_helper'

RSpec.describe "User Registration", type: :feature do
  scenario "User signs up successfully" do
    visit new_user_registration_path

    fill_in 'Email', with: 'valid@email.fr'
    fill_in 'user_password', with: 'tototo'
    fill_in 'user_password_confirmation', with: 'tototo'
    click_button "S'inscrire"

    expect(page).to have_content 'Mon Profil'
  end
end
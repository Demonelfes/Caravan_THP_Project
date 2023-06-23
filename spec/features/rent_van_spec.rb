require 'rails_helper'

RSpec.describe "Create Van", type: :feature do
  scenario "User creates a new van" do
    # Connecter l'utilisateur
    user = User.create(email: 'user@example.com', password: 'password')
    login_as(user, scope: :user)

    # Visiter la page de création de van
    visit new_van_path

    # Remplir le formulaire
    fill_in 'Titre', with: 'titre exemple'
    fill_in 'Description', with: 'ceci est une description d\'exemple'
    fill_in 'Immatriculation', with: 'AB-126-CD'
    fill_in 'Marque', with: 'renault'
    fill_in 'Ville', with: 'montpellier'
    fill_in 'Année', with: '2020'
    fill_in 'Carburant', with: 'essence'
    fill_in 'Nombre de lits', with: '3'
    fill_in 'Prix par jour', with: '300'
    attach_file 'Photos', Rails.root.join('app', 'assets', 'images', 'default_van1.jpg')

    # Cliquer sur le bouton Soumettre
    click_button 'Soumettre'

    # Vérifier que le van a été ajouté à la liste des vans
    expect(page).to have_content 'Le van a bien été enregistré.'
    expect(Van.last.title).to eq 'titre exemple'
    # Ajoutez d'autres assertions pour vérifier les autres attributs du van si nécessaire
  end
end

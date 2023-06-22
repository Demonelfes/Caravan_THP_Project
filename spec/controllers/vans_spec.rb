require 'rails_helper'

RSpec.describe VansController, type: :controller do
  include RSpec::Rails::ControllerExampleGroup

## INDEX ##
  describe "GET index" do
    it "assigns @vans" do
      van = FactoryBot.create(:van)
      get :index
      expect(assigns(:vans)).to include(van)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

## SHOW ##

  describe "GET show" do
    it "assigns @vans" do
      # création d'une instance
      van = FactoryBot.create(:van)

      # on va sur show
      get :show, id: van.slug
      # @user doit être user
      expect(assigns(:van)).to eq(van)
    end

    it "renders the show template" do
      # va sur show
      get :show

      # on doit rediriger vers show
      expect(response).to render_template("show")
    end
  end

end

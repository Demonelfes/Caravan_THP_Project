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
      van = FactoryBot.create(:van)


      get :show, params: { id: van.id }
      expect(assigns(:van)).to eq(van)
    end

  #   it "renders the show template" do
  #     get :show, params: { id: van.id }

  #     expect(response).to render_template("show")
  #   end
  end

end

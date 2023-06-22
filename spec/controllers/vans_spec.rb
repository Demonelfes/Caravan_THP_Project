require 'rails_helper'

RSpec.describe VansController, type: :controller do
  include RSpec::Rails::ControllerExampleGroup
  include Devise::Test::ControllerHelpers

  let(:user) { FactoryBot.create(:user) }

  before { sign_in user }

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

    it "renders the show template" do
      van = FactoryBot.create(:van)
      get :show, params: { id: van.id }
      expect(response).to render_template("show")
    end
  end

## NEW ##

  describe "GET new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

## EDIT ##

  describe "GET edit" do
    it "assigns @vans" do
      van = FactoryBot.create(:van)
      get :edit, params: { id: van.id }
      expect(assigns(:van)).to eq(van)
    end

    it "renders the edit template" do
      van = FactoryBot.create(:van)
      get :edit, params: { id: van.id }
      expect(response).to render_template("edit")
    end
  end

## CREATE ##

describe "POST create" do
  context "with valid attributes" do
    it "creates a new van" do
      tags = FactoryBot.create_list(:tag, 2)
      tag_ids = tags.map{ |tag| tag.id }

      expect {
        post :create, params: { van: FactoryBot.attributes_for(:van, tag_list: tag_ids) }
      }.to change(Van, :count).by(1)
    end

    it "redirects to the new van" do
      tags = FactoryBot.create_list(:tag, 2)
      tag_ids = tags.map{ |tag| tag.id }
      post :create, params: { van: FactoryBot.attributes_for(:van, tag_list: tag_ids) }
      expect(response).to redirect_to(Van.last)
    end
  end

    context "with one invalid attribute" do
      it "does not create a new van" do
        expect {
          post :create, params: { van: FactoryBot.attributes_for(:van, title: "") }
        }.to_not change(Van, :count)
      end

      it "re-renders the new method" do
        post :create, params: { van: FactoryBot.attributes_for(:van, title: "") }
        expect(response).to redirect_to(new_van_path)
      end
    end

## UPDATE ##

  describe "PUT update" do
    before :each do
      @van = FactoryBot.create(:van)
    end

    context "with valid attributes" do
      it "locates the requested @van" do
        tags = FactoryBot.create_list(:tag, 2)
        tag_ids = tags.map { |tag| tag.id }
        put :update, params: { slug: @van.slug, id: @van.id, van: FactoryBot.attributes_for(:van, tag_list: tag_ids) }
        expect(assigns(:van)).to eq(@van)
      end

      it "changes @van's attributes" do
        title = "new title"
        tags = FactoryBot.create_list(:tag, 2)
        tag_ids = tags.map { |tag| tag.id }
        put :update, params: { slug: @van.slug, id: @van.id, van: FactoryBot.attributes_for(:van, title: title, tag_list: tag_ids) }
        @van.reload
        @van.title.should eq(title)
      end

      it "redirects to the updated van" do
        title = "new title"
        tags = FactoryBot.create_list(:tag, 2)
        tag_ids = tags.map { |tag| tag.id }
        put :update, params: { slug: @van.slug, id: @van.id, van: FactoryBot.attributes_for(:van, title: title, tag_list: tag_ids) }
        response.should redirect_to @van
      end
    end

    context "with one invalid attribute" do
      it "locates the requested @van" do
        title = ""
        tags = FactoryBot.create_list(:tag, 2)
        tag_ids = tags.map { |tag| tag.id }
        put :update, params: { slug: @van.slug, id: @van.id, van: FactoryBot.attributes_for(:van, title: title, tag_list: tag_ids) }
        expect(assigns(:van)).to eq(@van)
      end

      it "does not change @user's attributes" do
        title = ""
        tags = FactoryBot.create_list(:tag, 2)
        tag_ids = tags.map { |tag| tag.id }
        put :update, params: { slug: @van.slug, id: @van.id, van: FactoryBot.attributes_for(:van, title: title, tag_list: tag_ids) }
        @van.reload
        @van.title.should_not eq(title)
      end

      it "re-renders the edit method" do
        title = ""
        tags = FactoryBot.create_list(:tag, 2)
        tag_ids = tags.map { |tag| tag.id }
        put :update, params: { slug: @van.slug, id: @van.id, van: FactoryBot.attributes_for(:van, title: title, tag_list: tag_ids) }
        response.should render_template :edit
      end
    end
  end

  end
end

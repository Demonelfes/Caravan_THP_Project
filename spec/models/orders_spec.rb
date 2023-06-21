require 'rails_helper'

RSpec.describe Order, type: :model do

  before(:each) do
    @order = FactoryBot.create(:order)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@order).to be_a(Order)
      expect(@order).to be_valid
    end

    # it 'should send an order confirmation to the customer if the van is not a van pro' do
    #   van = FactoryBot.create(:van, is_van_pro: false)
    #   customer = FactoryBot.create(:user)
    #   rental = FactoryBot.create(:rental, customer: customer, van: van)
    #   order = FactoryBot.create(:order, rental: rental)
    #   expect(UserMailer).to receive(:order_confirmation_to_customer_email).with(customer, order).and_return(double(deliver_now: true))
    #   order.order_confirmation_to_customer_send
    # end

      it 'should send an order confirmation to the owner if the van is not a van pro' do
        van = FactoryBot.create(:van, is_van_pro: false)
        owner = FactoryBot.create(:user)
        rental = FactoryBot.create(:rental, owner: owner, van: van)
        order = FactoryBot.create(:order, rental: rental)
        expect(UserMailer).to receive(:order_confirmation_to_owner_email).with(owner, order).and_return(double(deliver_now: true))
        order.order_confirmation_to_owner_send
      end

      it 'should not send an order confirmation to the owner if the van is a van pro' do
        van = FactoryBot.create(:van, is_van_pro: true)
        owner = FactoryBot.create(:user)
        rental = FactoryBot.create(:rental, owner: owner)
        order = FactoryBot.create(:order, rental: rental)
        expect(UserMailer).not_to receive(:order_confirmation_to_owner_email)
      end

      it 'should send a private van order confirmation to the admin if the van is not a van pro' do
        van = FactoryBot.create(:van, is_van_pro: false)
        admin = FactoryBot.create(:user, is_admin: true)
        rental = FactoryBot.create(:rental, owner: admin, van: van)
        order = FactoryBot.create(:order, rental: rental)
        expect(AdminMailer).to receive(:admin_order_confirmation_van_private_email).with(admin, order).and_return(double(deliver_now: true))
        order.admin_order_confirmation_van_private_send
      end

      it 'should send a pro van order confirmation to the admin if the van is a van pro' do
        van = FactoryBot.create(:van, is_van_pro: true)
        admin = FactoryBot.create(:user, is_admin: true)
        rental = FactoryBot.create(:rental, owner: admin, van: van)
        order = FactoryBot.create(:order, rental: rental)
        expect(AdminMailer).to receive(:admin_order_confirmation_van_pro_email).with(admin, order).and_return(double(deliver_now: true))
        order.admin_order_confirmation_van_pro_send
      end

## RENTAL ID ##
    describe "#rental_id" do
      it "should not be missing" do
        bad_order = Order.create(rental_id: "")
        expect(bad_order).not_to be_valid
        expect(bad_order.errors.include?(:rental_id)).to eq(true)
      end
    end
  end

  context "associations" do

    describe "rental" do
      it "should belong to rental" do
        rental = Rental.create(order: @order)
        expect(@order.rental).to eq(rental)
      end
    end

    describe "van" do
      it "should have one van" do
        van = FactoryBot.create(:van)
        rental = FactoryBot.create(:rental, van: van)
        order = FactoryBot.create(:order, rental: rental)
        expect(order.van).to eq(van)
      end
    end

    describe "customer" do
      it "should have one customer" do
        customer = FactoryBot.create(:user)
        rental = FactoryBot.create(:rental, customer: customer)
        order = FactoryBot.create(:order, rental: rental)
        expect(order.customer).to eq(customer)
      end
    end

    describe "owner" do
      it "should have one owner" do
        owner = FactoryBot.create(:user)
        rental = FactoryBot.create(:rental, owner: owner)
        order = FactoryBot.create(:order, rental: rental)
        expect(order.owner).to eq(owner)
      end
    end

  end
end

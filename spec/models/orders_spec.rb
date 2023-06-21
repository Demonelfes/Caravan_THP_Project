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

    # it 'sends an order confirmation to the customer' do
    #   customer = FactoryBot.create(:user)
    #   rental = FactoryBot.create(:rental, customer: customer)
    #   order = FactoryBot.create(:order, rental: rental)
    #   expect(UserMailer).to receive(:order_confirmation_to_customer_email).with(customer, order).and_return(double(deliver_now: true))
    #   order.order_confirmation_to_customer_send
    # end

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

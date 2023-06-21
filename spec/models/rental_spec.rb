require 'rails_helper'

RSpec.describe Rental, type: :model do

  before(:each) do
    @rental = FactoryBot.create(:rental)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@rental).to be_a(Rental)
      expect(@rental).to be_valid
    end

## START DATE ##
    describe "#start_date" do
      it "should not be missing" do
        bad_rental = Rental.create(start_date: "")
        expect(bad_rental).not_to be_valid
        expect(bad_rental.errors.include?(:start_date)).to eq(true)
      end
    end

    describe "#start_date" do
      it "should not be lower than now" do
        bad_rental = Rental.create(start_date: DateTime.now - 1)
        expect(bad_rental).not_to be_valid
        expect(bad_rental.errors.include?(:start_date)).to eq(true)
      end
    end

## END DATE ##
    describe "#end_date" do
      it "should not be lower than start_date" do
        bad_rental = Rental.create(start_date: DateTime.now + 2, end_date: DateTime.now + 1)
        expect(bad_rental).not_to be_valid
        expect(bad_rental.errors.include?(:end_date)).to eq(true)
      end
    end

## TOTAL PRICE ##

    describe "#total_price" do
      it "should not be missing" do
        bad_rental = Rental.create(total_price: "")
        expect(bad_rental).not_to be_valid
        expect(bad_rental.errors.include?(:total_price)).to eq(true)
      end
    end

## OWNER_ID ##

    describe "#owner_id" do
      it "should not be missing" do
        bad_rental = Rental.create(owner_id: "")
        expect(bad_rental).not_to be_valid
        expect(bad_rental.errors.include?(:owner_id)).to eq(true)
      end
    end

## CUSTOMER_ID ##

    describe "#customer_id" do
      it "should not be missing" do
        bad_rental = Rental.create(customer_id: "")
        expect(bad_rental).not_to be_valid
        expect(bad_rental.errors.include?(:customer_id)).to eq(true)
      end
    end

## VAN_ID ##
    describe "#van_id" do
      it "should not be missing" do
        bad_rental = Rental.create(van_id: "")
        expect(bad_rental).not_to be_valid
        expect(bad_rental.errors.include?(:van_id)).to eq(true)
      end
    end

# DUPLICATE_RENTAL ##
    describe "duplicate_rental validation" do
      it "should return an error when there is an order with the same van and overlapping dates" do
        van = FactoryBot.create(:van)
        rental = FactoryBot.create(:rental, van: van)
        order = FactoryBot.create(:order, rental: rental)
        rental = FactoryBot.create(:rental, order: order, start_date: order.start_date - 1, end_date: order.end_date + 1)
        expect(rental).not_to be_valid
        expect(rental.errors[:base]).to include("-Cette période n'est pas disponible.")
      end

      it "returns no errors when there is an order with a different van" do
        van = FactoryBot.create(:van)
        rental = FactoryBot.create(:rental, van: van)
        expect(rental).to be_valid
      end
    end
  end

## ** ASSOCIATIONS **##

  context "associations" do

    describe "order" do
      it "should have one order" do
        order = Order.create(rental: @rental)
        expect(@rental.order).to eq(order)
      end
    end


    describe "van" do
      it "should belong to a van" do
        van = FactoryBot.create(:van)
        rental = FactoryBot.create(:rental, van: van)
        expect(rental.van).to eq(van)
      end
    end

    describe "customer" do
      it "should belong to a customer" do
        customer = FactoryBot.create(:user)
        rental = FactoryBot.create(:rental, customer: customer)
        expect(rental.customer).to eq(customer)
      end
    end

    describe "owner" do
      it "should belong to an owner" do
        owner = FactoryBot.create(:user)
        rental = FactoryBot.create(:rental, owner: owner)
        expect(rental.owner).to eq(owner)
      end
    end

  end
end

require 'rails_helper'

RSpec.describe Van, type: :model do

  before(:each) do
    @van = Van.create(title: "Van de toto", description: "ceci est le van de toto il est bo", city: "Ici", brand: "marque", registration:"AA-123-BB", year:"1990", energy:"fuel", bed_number: 3, price_per_day: 5, user_id: 5)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@van).to be_a(Van)
      expect(@van).to be_valid
    end


## TITLE ##
    describe "#title" do
      it "should not be missing" do
        bad_van = Van.create(title: "" )
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:title)).to eq(true)
      end
    end


    describe "#title" do
      it "should not be lower than 6 characters" do
        bad_van = Van.create(title: "Van")
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:title)).to eq(true)
      end
    end

    describe "#title" do
      it "should not be greater than 20 characters" do
        bad_van = Van.create(title: "Ce nom de Van est beaucoup trop long")
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:title)).to eq(true)
      end
    end

## DESCRIPTION ##
    describe "#description" do
      it "should not be missing" do
        bad_van = Van.create(description: "")
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:description)).to eq(true)
      end
    end

    describe "#description" do
      it "should not be lower than 20 characters" do
        bad_van = Van.create(description: "youpi")
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:description)).to eq(true)
      end
    end

    describe "#description" do
      it "should not be greater than 250 characters" do
        bad_van = Van.create(description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in tristique tortor, ac facilisis neque. Nunc gravida quam in sapien auctor, id iaculis massa congue. Integer ultricies, erat eget feugiat scelerisque, odio ipsum aliquam enim, at vestibulum odio erat sed nisi. Sed non justo nec leo auctor interdum. In fermentum, ligula at volutpat sollicitudin, justo felis dapibus odio, vitae aliquet lorem turpis et magna. Mauris faucibus pharetra hendrerit. Sed vel finibus enim. Sed ac libero nulla. Fusce euismod turpis et quam lobortis, ut consectetur odio aliquam. Nulla sed nisl luctus, euismod est at, aliquet lectus. Nam laoreet, purus ac sagittis fermentum, mauris leo feugiat sem, id vestibulum arcu orci ut ipsum. Aliquam aliquam diam eu mauris lobortis feugiat. Cras vitae orci euismod, ullamcorper sem vel, vestibulum tortor. Nulla facilisi. Donec a semper risus.")
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:description)).to eq(true)
      end
    end

## CITY ##
    describe "#city" do
      it "should not be missing" do
        bad_van = Van.create(city: "")
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:city)).to eq(true)
      end
    end

## BRAND ##
    describe "#brand" do
      it "should not be missing" do
        bad_van = Van.create(brand: "")
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:brand)).to eq(true)
      end
    end

    describe "#brand" do
      it "should not be lower than 2 characters" do
        bad_van = Van.create(brand: "a")
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:brand)).to eq(true)
      end
    end

    describe "#brand" do
      it "should not be greater than 20 characters" do
        bad_van = Van.create(brand: "Ceci est un nom de marque beaucoup trop long")
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:brand)).to eq(true)
      end
    end

#REGISTRATION
    describe "#registration" do
      it "should not be missing" do
        bad_van = Van.create(registration: "")
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:brand)).to eq(true)
      end
    end

    describe "#registration" do
      it "should not have a registration plate that is not French" do
        bad_van = Van.create(registration: "ABC-123")
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:brand)).to eq(true)
      end
    end

## YEAR ##
    describe "#year" do
      it "should not be missing" do
        bad_van = Van.create(year: nil)
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:year)).to eq(true)
      end
    end

    describe "#year" do
      it "should not be lower than 1940 or greater than today" do
        bad_van_past = Van.create(year: 1939)
        bad_van_future = Van.create(year: Date.current.year + 1)
        expect(bad_van_past).not_to be_valid
        expect(bad_van_future).not_to be_valid
        expect(bad_van_past.errors.include?(:year)).to eq(true)
        expect(bad_van_future.errors.include?(:year)).to eq(true)
      end
    end

## ENERGY ##
    describe "#energy" do
      it "should not be missing" do
        bad_van = Van.create(energy: nil)
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:energy)).to eq(true)
      end
    end

    describe "#energy" do
      it "should not be lower than 2 characters " do
        bad_van = Van.create(energy: "a")
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:energy)).to eq(true)
      end
    end

    describe "#energy" do
      it "should not be greater than 20 characters " do
        bad_van = Van.create(energy: "Ceci est un nom de carburant beaucoup trop long")
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:energy)).to eq(true)
      end
    end

## BED NUMBER ##
    describe "#bed_number" do
      it "should not be missing" do
        bad_van = Van.create(bed_number: nil)
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:bed_number)).to eq(true)
      end
    end

## PRICE PER DAY ##
    describe "#price_per_day" do
      it "should not be missing" do
        bad_van = Van.create(price_per_day: nil)
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:price_per_day)).to eq(true)
      end
    end

    describe "#price_per_day" do
      it "should not be equal to 0 " do
        bad_van = Van.create(price_per_day: 0)
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:price_per_day)).to eq(true)
      end
    end

## USER_ID ##
    describe "#user_id" do
      it "should not be missing" do
        bad_van = Van.create(user_id:nil)
        expect(bad_van).not_to be_valid
        expect(bad_van.errors.include?(:user_id)).to eq(true)
      end
    end

## ** ASSOCIATIONS ** ##

    context "associations" do

      describe "user" do
        it "should belong to a user" do
          user = FactoryBot.create(:user)
          van = FactoryBot.create(:van, user: user)

          expect(van.user).to eq(user)
        end
      end

      describe "rentals" do
        it "should have_many rentals" do
          rental = FactoryBot.create(:rental, van: @van)
          expect(@van.rentals.include?(rental)).to eq(true)
        end
      end

      describe "orders" do
        it "should have_many orders" do
          order = FactoryBot.create(:order, van: @van)
          expect(@van.rentals.map{|rental| rental.order}.include?(order)).to eq(true)
        end
      end

      describe "join_van_tags" do
        it "should have_many join_van_tags" do
          join_van_tag = FactoryBot.create(:join_van_tag, van: @van)
          expect(@van.join_van_tags.include?(join_van_tag)).to eq(true)
        end
      end

      describe "tags" do
        it "should have_many tags" do
          tag = FactoryBot.create(:tag)
          join_van_tag = FactoryBot.create(:join_van_tag, van: @van, tag: tag)
          expect(@van.tags.include?(tag)).to eq(true)
        end
      end

      describe "customers" do
        it "should have_many customers" do
          customer = FactoryBot.create(:user)
          rental = FactoryBot.create(:rental, van: @van, customer: customer )
          orders = FactoryBot.create(:order, rental: rental )
          expect(@van.customers.include?(customer)).to eq(true)
        end
      end

      describe "photo" do
        it "should have an attached photo" do
          van = FactoryBot.create(:van)
          expect(van.photo).to be_an_instance_of(ActiveStorage::Attached::One)
        end
      end
    end
  end
end

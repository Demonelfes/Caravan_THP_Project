require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = FactoryBot.create(:user)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    it 'sends a welcome email' do
      expect(UserMailer).to receive(:welcome_email).with(@user).and_return(double(deliver_now: true))
      @user.welcome_send
    end
  end

  context "associations" do

    describe "vans" do
      it "should have_many vans" do
        van = FactoryBot.create(:van, user: @user)
        expect(@user.vans.include?(van)).to eq(true)
      end
    end

    describe "rentals" do
      it "should have many taken rentals" do
        rental1 = FactoryBot.create(:rental, customer: @user)
        rental2 = FactoryBot.create(:rental, customer: @user)
        rental3 = FactoryBot.create(:rental)
        expect(@user.taken_rentals).to include(rental1, rental2)
        expect(@user.taken_rentals).not_to include(rental3)
      end
    end

    describe "rentals" do
      it "have many given rentals" do
        rental1 = FactoryBot.create(:rental, owner: @user)
        rental2 = FactoryBot.create(:rental, owner: @user)
        rental3 = FactoryBot.create(:rental)
        expect(@user.given_rentals).to include(rental1, rental2)
        expect(@user.given_rentals).not_to include(rental3)
      end
    end
  end

end

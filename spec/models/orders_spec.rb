require 'rails_helper'

RSpec.describe Rental, type: :model do

  before(:each) do
    @order = FactoryBot.create(:order)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@order).to be_a(Order)
      expect(@order).to be_valid
    end

    
  end

end

require 'rails_helper'

RSpec.describe Tag, type: :model do

  before(:each) do
    @tag = FactoryBot.create(:tag)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@tag).to be_a(Tag)
      expect(@tag).to be_valid
    end

## TITLE ##
    describe "#title" do
      it "should not be missing" do
        bad_tag = Tag.create(title: "" )
        expect(bad_tag).not_to be_valid
        expect(bad_tag.errors.include?(:title)).to eq(true)
      end
    end

    describe "#title" do
      it "should not be lower than 3 characters" do
        bad_tag = Tag.create(title: "Ta" )
        expect(bad_tag).not_to be_valid
        expect(bad_tag.errors.include?(:title)).to eq(true)
      end
    end

    describe "#title" do
      it "should not be greater than 20 characters" do
        bad_tag = Tag.create(title: "Ceci est un titre beaucoup trop long" )
        expect(bad_tag).not_to be_valid
        expect(bad_tag.errors.include?(:title)).to eq(true)
      end
    end
  end

## ** ASSOCIATIONS ** ##

  context "associations" do

    describe "join_van_tags" do
      it "should have_many join_van_tags" do
        join_van_tag = FactoryBot.create(:join_van_tag, tag: @tag)
        expect(@tag.join_van_tags.include?(join_van_tag)).to eq(true)
      end
    end

    describe "vans" do
      it "should have_many vans" do
        van = FactoryBot.create(:van)
        join_van_tag = FactoryBot.create(:join_van_tag, tag: @tag, van: van)
        expect(@tag.join_van_tags.include?(join_van_tag)).to eq(true)
      end
    end
  end
end

require 'rails_helper'

RSpec.describe JoinVanTag, type: :model do

  before(:each) do
    @join_van_tag = FactoryBot.create(:join_van_tag)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@join_van_tag).to be_a(JoinVanTag)
      expect(@join_van_tag).to be_valid
    end

    describe "#tag_id" do
      it "should not be missing" do
        bad_join_van_tag = JoinVanTag.create(tag_id: "")
        expect(bad_join_van_tag).not_to be_valid
        expect(bad_join_van_tag.errors.include?(:tag_id)).to eq(true)
      end
    end

    describe "#van_id" do
      it "should not be missing" do
        bad_join_van_tag = JoinVanTag.create(van_id: "")
        expect(bad_join_van_tag).not_to be_valid
        expect(bad_join_van_tag.errors.include?(:van_id)).to eq(true)
      end
    end
  end
  
  context "associations" do

    describe "tag" do
      it "should belong to a tag" do
        tag = FactoryBot.create(:tag)
        join_van_tag = FactoryBot.create(:join_van_tag, tag: tag)
        expect(join_van_tag.tag).to eq(tag)
      end
    end

    describe "van" do
      it "should belong to a van" do
        van = FactoryBot.create(:van)
        join_van_tag = FactoryBot.create(:join_van_tag, van: van)
        expect(join_van_tag.van).to eq(van)
      end
    end
  end
end

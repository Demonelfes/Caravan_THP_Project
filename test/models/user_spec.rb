require 'rails_helper'

RSpec.describe TonModel, type: :model do

  before(:each) do
  # en général, tu as envie de créer une nouvelle instance
  @user = User.create(email: "chadmin@admin.fr", password: "password", is_admin: true)
  end

  context "associations" do

    describe "some association" do
      # teste cette association
    end

  end

end

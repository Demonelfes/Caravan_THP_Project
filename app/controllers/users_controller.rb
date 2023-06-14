class UsersController < ApplicationController
  before_action :set_user, only: [:show, :rent_vans, :my_van_dashboard]
  def index
  end

  def show
  end

  def update
  end

  def edit
  end
  private

  def set_user
    @user = User.find(params[:id])
  end
end

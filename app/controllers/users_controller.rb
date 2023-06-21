class UsersController < ApplicationController

  def show
    @user = User.friendly.find(params[:id])
    @visible_vans = @user.vans.where(is_hidden: false)
  end
  
end
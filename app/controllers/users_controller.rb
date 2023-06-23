class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_is_current_user, only: [:show]  

  def show
    @user = User.friendly.find(params[:id])
    @visible_vans = @user.vans.where(is_hidden: false)
  end
  
  private 
  def user_is_current_user
    unless current_user == User.friendly.find(params[:id])
      flash[:alert] = "Accès non autorisé"
      redirect_to root_path    
    end
  end
end
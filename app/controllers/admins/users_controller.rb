class Admins::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def edit
    @user = User.friendly.find(params[:id])
  end 

  def update    
    if User.friendly.find(params[:id]).update(user_params)
      flash[:success] = "Réservation mise à jour avec succès."
      redirect_to admins_vans_path
    else
      render :edit
    end    
  end 
  
  private 

  def user_params
    params.require(:user).permit(:user_id, :created_at,:email, :is_admin)
  end
  
  def require_admin
    unless current_user && current_user.is_admin?
      flash[:alert] = "Accès non autorisé"
      redirect_to root_path
    end
  end
end

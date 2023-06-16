class Admins::UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end 

  def update    
    if User.find(params[:id]).update(user_params)
      redirect_to admins_vans_path, notice: 'Réservation mise à jour avec succès.'
    else
      render :edit
    end    
  end 
  
  private 

  def user_params
    params.require(:user).permit(:user_id, :created_at,:email, :is_admin)
  end
end

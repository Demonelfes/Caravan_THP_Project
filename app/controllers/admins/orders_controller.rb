class Admins::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def edit
    @order = Order.find(params[:id])
  end

  def update
    if Order.find(params[:id]).rental.update(order_params)
      flash[:success] = "Réservation mise à jour avec succès."
      redirect_to admins_vans_path
    else
      render :edit
    end
  end

  private

  def order_params
    params.require(:order).permit(:rental_id)
  end
  
  def require_admin
    unless current_user && current_user.is_admin?
      flash[:alert] = "Accès non autorisé"
      redirect_to root_path
    end
  end
end

class Admins::OrdersController < ApplicationController
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
end

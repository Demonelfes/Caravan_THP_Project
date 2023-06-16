class Admins::OrdersController < ApplicationController
  def edit
    @order = Order.find(params[:id])
  end

  def update
    if Order.find(params[:id]).rental.update(order_params)
      redirect_to admins_vans_path, notice: 'Réservation mise à jour avec succès.'
    else
      render :edit
    end
  end

  private

  def order_params
    params.require(:order).permit(:rental_id)
  end
end

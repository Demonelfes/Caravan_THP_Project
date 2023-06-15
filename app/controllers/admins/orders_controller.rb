class Admins::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def edit
    @order = Order.find(params[:id])
  end 

  def update    
    if Order.find(params[:id]).update(order_params)
      redirect_to admins_vans_path, notice: 'Réservation mise à jour avec succès.'
    else
      render :edit
    end    
  end 

  def new
  end

  def create
  end


  private 

  def order_params
    params.require(:order).permit(:start_date, :end_date,:total_price, :customer_id, :van_id)
  end
end

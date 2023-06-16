class OrdersController < ApplicationController
  before_action :require_same_user, only: [:show,]
  
  def show
  end


  private 


  def require_same_user
    @order = Order.find(params[:id])
  
    unless current_user && (current_user == @order.user || current_user.is_admin?)
      redirect_to root_path
    end
  end
  
end

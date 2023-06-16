class RentalsController < ApplicationController
  def create
    @van = Van.find(params[:rental_id].to_i)
    @rental = Rental.new(
      'start_date' => params[:start],
      'end_date' => params[:end],
      'van_id' => @van.id,
      'customer_id' => current_user.id,
      'owner_id' => @van.user.id,
      'total_price' => (params[:end].to_date - params[:start].to_date).to_i * @van.price_per_day)
    if @rental.save
      redirect_to van_path(@van, success: true)
    else
      redirect_to van_path(@van, error: true)
    end
  end

  def show
  end

end

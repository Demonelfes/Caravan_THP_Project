class RentalsController < ApplicationController
  add_flash_types :info, :error, :success

  def create
    @van = Van.find(params[:rental_id].to_i)
    if (params[:start] == "") || (params[:end] == "")
      @rental = Rental.new(
        'van_id' => @van.id,
        'customer_id' => current_user.id,
        'owner_id' => @van.user.id,
        'total_price' => 1
      )
    else
      @rental = Rental.new(
        'start_date' => params[:start],
        'end_date' => params[:end],
        'van_id' => @van.id,
        'customer_id' => current_user.id,
        'owner_id' => @van.user.id,
        'total_price' => (params[:end].to_date - params[:start].to_date).to_i * @van.price_per_day)
    end
    if @rental.save
      redirect_to van_path(@van, check_availability:1)
    else
      flash[:alert] = @rental.errors.full_messages
      redirect_to van_path(@van, check_availability:0)
    end

  end

  def show
  end

end

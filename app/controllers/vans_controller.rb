class VansController < ApplicationController
  def index
    @visible_vans = Van.all.where(is_hidden:false)
    @vans = Van.all
  end

  def show
    @van = Van.find(params[:id])
    @rental = @van.rentals.last
    # @duration = (@rental.start_date...@rental.end_date).count
    @duration = (@rental.end_date.to_date - @rental.start_date.to_date).to_i
    @total = @duration * @van.price_per_day

    @orders = @van.rentals.where(start_date: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week)

    # @van.orders.each do |rental|
    # @orders = rental.where(start_date: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week)
    # end
  end

  def update
    @van = Van.find(params[:id])
    if Van.find(params[:id]).update(van_params)
      redirect_to van_path(@van), notice: 'Van mis à jour avec succès.'
    else
      render :edit
    end
  end

  def edit
    @van = Van.find(params[:id])
  end

  def new
    @van = Van.new
  end

  def create
    @van = Van.new(van_params)
    @van.is_van_pro = false
    @van.is_hidden = false
    @van.user_id = current_user.id
    if @van.save
      redirect_to van_path(@van), notice: "Le van à été créé avec succès."
    else
      flash[:alert] = @van.errors.full_messages.join(", ")
      redirect_to new_van_path
    end
  end

  def hide_van
    @van = Van.find(params[:id])
    @van.is_hidden = !@van.is_hidden
    @van.save
    redirect_to user_path(current_user)
  end

  private

  def van_params
    params.require(:van).permit(:title, :description, :registration, :brand, :city, :is_manual_transmission, :year, :energy, :bed_number, :has_wc, :has_fridge, :has_shower, :price_per_day, :is_hidden, :photo)
  end
end

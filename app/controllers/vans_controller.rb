class VansController < ApplicationController
  def index
    @vans = Van.all
  end

  def show
    @van = Van.find(params[:id])
    @rental = @van.rentals.last
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
    @van.user_id = current_user.id
    if @van.save
      redirect_to van_path(@van), notice: "Le van à été créé avec succès."
    else
      flash[:alert] = @van.errors.full_messages.join(", ")
      redirect_to new_van_path
    end
  end

  private

  def van_params
    params.require(:van).permit(:title, :description, :registration, :brand, :city, :is_manual_transmission, :year, :energy, :bed_number, :has_wc, :has_fridge, :has_shower, :price_per_day)
  end
end

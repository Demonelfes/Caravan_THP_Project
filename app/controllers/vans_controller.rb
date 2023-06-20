class VansController < ApplicationController
  def index
    @visible_vans = Van.all.where(is_hidden:false)
    @vans = Van.all
  end

  def full_index
    @visible_vans = Van.all.where(is_hidden:false)
    @vans = Van.all
  end

  def show
    @van = Van.find(params[:id])
    @rental = @van.rentals.last

    if @van.rentals.map{|rental| rental.order}.uniq == [nil] || @van.rentals.map{|rental| rental.order}.uniq == []
      @check_orders = 0
    else
      @orders = Order.where(rental_id:Rental.all
        .where(start_date:Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week)
        .where(van_id:@van.id)
        .map{|rental| rental.id})
    end
  end

  def update
    @van = Van.find(params[:id])
    if Van.find(params[:id]).update(van_params)
      flash[:success] = "Van mis à jour avec succès."
      redirect_to van_path(@van)
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
      flash[:success] = "Le van a bien été enregistré."
      redirect_to van_path(@van)
    else
      flash[:alert] = @van.errors.full_messages
      redirect_to new_van_path
    end
  end

  def hide_van
    @van = Van.find(params[:id])
    @van.is_hidden = !@van.is_hidden
    @van.save
    flash[:info] = "Van supprimé avec succès."
    redirect_to user_path(current_user)
  end

  def filter_vans
    conditions = {}

    conditions[:has_fridge] = true if params[:has_fridge].present?
    conditions[:has_wc] = true if params[:has_wc].present?
    conditions[:has_shower] = true if params[:has_shower].present?
    conditions[:is_manual_transmission] = true if params[:is_manual_transmission].present?
    conditions[:year] = params.dig(:van, :year) if params.dig(:van, :year).present?
    conditions[:brand] = params.dig(:van, :brand) if params.dig(:van, :brand).present?
    conditions[:bed_number] = params.dig(:van, :bed_number) if params.dig(:van, :bed_number).present?

    @visible_vans = conditions.present? ? Van.where(conditions) : Van.all
    render :full_index
  end

  private

  def van_params
    params.require(:van).permit(:title, :description, :registration, :brand, :city, :is_manual_transmission, :year, :energy, :bed_number, :has_wc, :has_fridge, :has_shower, :price_per_day, :is_hidden, :photo)
  end
end

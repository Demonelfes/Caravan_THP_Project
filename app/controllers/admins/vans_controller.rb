class Admins::VansController < ApplicationController
  def index
    @orders = Order.all
    @users = User.all
    @vans = Van.all
  end

  def edit
    @van = Van.find(params[:id])
  end

  def update
    if Van.find(params[:id]).update(van_params)
      flash[:success] = "Van modifié avec succès."
      redirect_to admins_vans_path, notice: 'Van mis à jour avec succès.'
    else
      render :edit
    end
  end

  def new
    @van = Van.new
  end

  def create
    @van = Van.new(van_params)
    @van.is_van_pro = true
    @van.user_id = current_user.id
    if @van.save
      flash[:success] = "Le van a bien été enregistré."
      redirect_to admins_vans_path
    else
      flash[:alert] = @van.errors.full_messages.join(", ")
      redirect_to new_admins_van_path
    end
  end

  def hide_van
    @van = Van.find(params[:id])
    @van.is_hidden = !@van.is_hidden
    @van.save
    flash[:info] = "Van masqué avec succès."
    redirect_to admins_vans_path
  end

  private

  def van_params
    params.require(:van).permit(:title, :is_hidden,:description, :registration, :brand, :city, :is_manual_transmission, :year, :energy, :bed_number, :has_wc, :has_fridge, :has_shower, :price_per_day, :photo)
  end
end

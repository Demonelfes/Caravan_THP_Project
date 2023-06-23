class Admins::VansController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  
  def index
    @orders = Order.all
    @users = User.all
    @vans = Van.all
  end

  def edit
    @van = Van.friendly.find(params[:id])
  end

  def update
    @van = Van.friendly.find(params[:id])
    if @van.update(van_params.except(:tag_list))
      flash[:success] = "Van modifié avec succès."

      @current_van_tags = @van.tags.map{|tag|tag.id}
      @new_tags = van_params[:tag_list].drop(1)
      @join_tags_to_create = @new_tags - @current_van_tags
      @join_tags_to_destroy = @current_van_tags - @new_tags

      @join_tags_to_create.each do |tag|
        JoinVanTag.create(van_id: @van.id, tag_id: Tag.find(tag).id)
      end 

      @join_tags_to_destroy.each do |tag|
        JoinVanTag.find_by(van_id: @van.id, tag_id: Tag.find(tag).id).destroy
      end 

      redirect_to admins_vans_path
    else
      render :edit
    end
  end

  def new
    @van = Van.new
  end

  def create
    @van = Van.new(van_params.except(:tag_list))
    @van.is_van_pro = true
    @van.user_id = current_user.id
    if @van.save
      flash[:success] = "Le van a bien été enregistré."

      van_params[:tag_list].drop(1).each do |tag|
        JoinVanTag.create(van_id: @van.id, tag_id: Tag.find(tag).id)
      end 

      redirect_to admins_vans_path
    else
      flash[:alert] = @van.errors.full_messages
      redirect_to new_admins_van_path
    end
  end

  def hide_van
    @van = Van.friendly.find(params[:id])
    @van.is_hidden = !@van.is_hidden
    @van.save
    flash[:info] = "Van masqué avec succès."
    redirect_to admins_vans_path
  end

  private
  
  def van_params
    params.require(:van).permit(:title, :is_hidden,:description, :registration, :brand, :city, :is_manual_transmission, :year, :energy, :bed_number, :has_wc, :has_fridge, :has_shower, :price_per_day, photos:[], tag_list:[])
  end
  
  def require_admin
    unless current_user && current_user.is_admin?
      flash[:alert] = "Accès non autorisé"
      redirect_to root_path
    end
  end
end

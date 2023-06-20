class VansController < ApplicationController
  def index
    @visible_vans = Van.all.where(is_hidden:false)
    @vans = Van.all
  end

  def full_index
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
    if @van.update(van_params.except(:tag_list))
      flash[:success] = "Van mis à jour avec succès."

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
    @van = Van.new(van_params.except(:tag_list))
    @van.is_van_pro = false
    @van.is_hidden = false
    @van.user_id = current_user.id
    if @van.save
      flash[:success] = "Le van a bien été enregistré."
      van_params[:tag_list].each do |tag|
        JoinVanTag.create(van_id: @van.id, tag_id: Tag.find(tag).id)
      end 
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

  private

  def van_params
    params.require(:van).permit(:title, :description, :registration, :brand, :city, :is_manual_transmission, :year, :energy, :bed_number, :has_wc, :has_fridge, :has_shower, :price_per_day, :is_hidden, :photo)
  end
end

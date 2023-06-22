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
    @van = Van.friendly.find(params[:id])
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
    @van = Van.friendly.find(params[:id])
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
    @van = Van.friendly.find(params[:id])
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
      van_params[:tag_list].drop(1).each do |tag|
        JoinVanTag.create(van_id: @van.id, tag_id: Tag.find(tag).id)
      end
      redirect_to van_path(@van)
    else
      flash[:alert] = @van.errors.full_messages
      redirect_to new_van_path
    end
  end

  def hide_van
    @van = Van.friendly.find(params[:id])
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


    if params.dig(:van, :city).present?
      @visible_vans = conditions.present? ? Van.near(params.dig(:van, :city),10).where(conditions).where(is_hidden:false) : Van.near(params.dig(:van, :city),10).where(is_hidden:false)
    else 
      @visible_vans = conditions.present? ? Van.where(conditions).where(is_hidden:false) : Van.where(is_hidden:false)
    end 
    
    if params[:tag_ids] != nil
       @visible_vans = @visible_vans.where(id:Tag.all.where(id:params[:tag_ids]).map{|tag|tag.vans}.flatten.uniq.map{|van|van.id})
    end 
    if params[:start_date] != "" && params[:end_date] != ""
      not_available_vans = @visible_vans.joins(:rentals).joins("INNER JOIN orders ON rentals.id = orders.rental_id").where("rentals.start_date >= ? AND rentals.start_date <= ? OR rentals.end_date >= ? AND rentals.end_date <= ?",
      params[:start_date], params[:end_date], params[:start_date], params[:end_date])
      @visible_vans = @visible_vans - not_available_vans
    end  

    render :full_index
  end

  def dates_filter
    # Pour le radius, faire comme pour city mais s'assurer que l'info soit passer dans les deux defs. (LAURIE A DEJA ESSAYE INFO PAS SUR)
    @visible_vans = Van.where(is_hidden:false)

    if params.dig(:van, :city).present?
      @visible_vans = Van.near(params.dig(:van, :city),10).where(is_hidden:false)
    else 
      @visible_vans = Van.where(is_hidden:false)
    end 

    if params[:start_date] != "" && params[:end_date] != ""
      not_available_vans = @visible_vans.joins(:rentals).joins("INNER JOIN orders ON rentals.id = orders.rental_id").where("rentals.start_date >= ? AND rentals.start_date <= ? OR rentals.end_date >= ? AND rentals.end_date <= ?",
      params[:start_date], params[:end_date], params[:start_date], params[:end_date])
      @visible_vans = @visible_vans - not_available_vans
    end 

    render :full_index
    #redirect_to full_index_vans_path
  end 

  private

  def van_params
    params.require(:van).permit(:title, :description, :registration, :brand, :city, :is_manual_transmission, :year, :energy, :bed_number, :has_wc, :has_fridge, :has_shower, :price_per_day, :is_hidden, photos:[], tag_list:[])
  end
end

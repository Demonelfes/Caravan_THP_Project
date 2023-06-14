class Admins::VansController < ApplicationController
  def index 
    @vans = Van.all
  end

  def show
  end

  def update
  end

  def edit
  end

  def new
  end

  def create
  end

  def hide_van
    @vans = Van.find(params[:id])
    @vans.is_hidden = !@vans.is_hidden
    @vans.save
    redirect_to admins_vans_path
  end
end

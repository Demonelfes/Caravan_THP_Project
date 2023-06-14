class VansController < ApplicationController
  def index
    @vans = Van.all
  end

  def show
    @van = Van.find(params[:id])
  end

  def update
  end

  def edit
  end

  def new
  end

  def create
  end
end

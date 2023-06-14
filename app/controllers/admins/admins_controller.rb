class Admins::AdminsController < ApplicationController
  def show
    @vans = Van.where(is_van_pro:true)
  end
end

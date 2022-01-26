class RentsController < ApplicationController

  def new
    @truck = Truck.find(params[:truck_id])
    @user = current_user
    @rent = Rent.new
  end

  def create
  end
end

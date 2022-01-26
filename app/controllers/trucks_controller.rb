class TrucksController < ApplicationController
  def index
    @trucks = Truck.all
  end

  def show
    @truck = Truck.find(params[:id])
  end

  def new
    @truck = Truck.new
  end

  def create
    @truck = Truck.new(truck_params)
    @truck.user = current_user
    @truck.save
    if @truck.save
      redirect_to truck_path(@truck)
    else
      render :new
    end
  end

  private

  def truck_params
    params.require(:truck).permit(:brand, :model, :description, :capacity, :price, :photo)
  end
end

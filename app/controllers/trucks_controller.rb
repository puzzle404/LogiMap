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

  def destroy
    @truck = Truck.find(params[:id])
    @truck.destroy
    redirect_to root_path
  end

  def edit
    @truck = Truck.find(params[:id])
  end

  def update
    @truck = Truck.find(params[:id])
    @truck.update(truck_params)
    redirect_to truck_path(@truck)
  end

  private

  def truck_params
    params.require(:truck).permit(:brand, :model, :description, :capacity, :price, :photo)
  end
end

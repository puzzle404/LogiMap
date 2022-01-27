class TrucksController < ApplicationController
  def index
    @trucks = policy_scope(Truck).order(created_at: :desc)
  end

  def show
    @truck = Truck.find(params[:id])
    authorize @truck
  end

  def new
    @truck = Truck.new
    authorize @truck
  end

  def create
    @truck = Truck.new(truck_params)
    @truck.user = current_user
    authorize @truck
    @truck.save

    if @truck.save
      redirect_to truck_path(@truck)
    else
      render :new
    end
  end

  def destroy
    @truck = Truck.find(params[:id])
    authorize @truck
    @truck.destroy
    redirect_to root_path
  end

  def edit
    @truck = Truck.find(params[:id])
    authorize @truck
  end

  def update
    @truck = Truck.find(params[:id])
    authorize @truck
    @truck.update(truck_params)
    redirect_to truck_path(@truck)
  end

  private

  def truck_params
    params.require(:truck).permit(:brand, :model, :description, :capacity, :price, :photo)
  end
end

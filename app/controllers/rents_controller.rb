class RentsController < ApplicationController

  def new
    @truck = Truck.find(params[:truck_id])
    @user = current_user
    @rent = Rent.new
  end

  def create
    @truck = Truck.find(params[:truck_id])
    @rent = Rent.new(rent_params)
    @rent.user = current_user
    @rent.truck = @truck
    if @rent.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:start_date, :end_date)
  end
end

class RentsController < ApplicationController
  def new
    @truck = Truck.find(params[:truck_id])
    @user = current_user
    # byebug
    if @truck.user == current_user
      flash[:alert] = 'No puedes rentar tu propio vehiculo'
      redirect_to root_path
    end
    @rent = Rent.new
    authorize @rent
  end

  def create
    @truck = Truck.find(params[:truck_id])
    @rent = Rent.new(rent_params)
    @rent.user = current_user
    @rent.truck = @truck
    authorize @rent
    if @rent.save
      redirect_to root_path
      authorize @rent
      flash[:alert] = 'Su renta se realizo con éxito'
    else
      render :new
    end
  end

  def index
      @rents = policy_scope(Rent).where(user_id: current_user)
  end

  private

  def rent_params
    params.require(:rent).permit(:start_date, :end_date)
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @toptrucks = Truck.last(3)
  end
end

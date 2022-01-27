class RentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    #truck_id, user_id
    # return false if Truck.find(truck_id).user == user
    # return true
    return true
  end

  def create?
    return true
  end

  def show?
    return true
  end
end

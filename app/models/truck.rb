class Truck < ApplicationRecord
  belongs_to :user, through: :rent
end

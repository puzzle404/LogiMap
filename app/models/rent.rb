class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :truck
end

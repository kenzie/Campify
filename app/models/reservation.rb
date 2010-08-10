class Reservation < ActiveRecord::Base
  belongs_to :campsite
  belongs_to :vehicle
end

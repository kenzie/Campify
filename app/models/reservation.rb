class Reservation < ActiveRecord::Base

  belongs_to :campsite
  belongs_to :vehicle

  validates :campsite, :presence => true
  validates :vehicle, :presence => true
  validates :arrival_at, :presence => true
  validates :departure_at, :presence => true

end

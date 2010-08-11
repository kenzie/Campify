class Reservation < ActiveRecord::Base

  belongs_to :campground
  belongs_to :campsite
  belongs_to :vehicle

  validates :campground, :presence => true
  validates :campsite, :presence => true
  validates :vehicle, :presence => true
  validates :arrival_at, :presence => true
  validates :departure_at, :presence => true

  def duration_in_days
    # TODO is this going to cause rounding problems with the hours/mins?
    (departure_at.to_i - arrival_at.to_i)/(60*60*24)
  end

  def available_campsites
    campground.campsites.fitting(vehicle).reject do |site|
      site.booked?(arrival_at,departure_at)
    end
  end

end

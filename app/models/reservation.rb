class Reservation < ActiveRecord::Base

  belongs_to :campground
  belongs_to :campsite
  belongs_to :vehicle

  validates :campground, :presence => true
  validates :campsite, :presence => true
  validates :vehicle, :presence => true
  validates :arrival_at, :presence => true
  validates :departure_at, :presence => true
  # validate campsite isn't already reserved for dates

  def arrival_at=(arrival_at)
    # force arrival time to noon
    super(arrival_at.beginning_of_day+12.hours)
  end

  def departure_at=(departure_at)
    # force departure time to noon
    super(departure_at.beginning_of_day+12.hours+1.second)
  end

  def duration_in_days
    (departure_at.to_i - arrival_at.to_i)/(60*60*24)
  end

  def available_campsites
    # find campsites that fit this vehicle
    campground.campsites.fitting(vehicle).reject do |site|
      # reject campsite if it's already reserved during the requested dates
      Reservation.
        where(:campsite_id => site.id).
        where('arrival_at < ? AND departure_at > ?', departure_at, arrival_at).
        first
    end
  end

end

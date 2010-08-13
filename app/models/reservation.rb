class Reservation < ActiveRecord::Base

  belongs_to :campground
  belongs_to :bookable, :polymorphic => true
  belongs_to :bookee, :polymorphic => true

  validates :campground, :presence => true
  validates :bookable, :presence => true
  # validates :bookee, :presence => true
  validates :arrival_at, :presence => true
  validates :departure_at, :presence => true
  # validates campsite isn't already reserved for dates

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
    campground.campsites.fitting(bookee).reject do |site|
      # reject campsite if it's already reserved during the requested dates
      Reservation.
        where(:bookable_id => site.id).
        where(:bookable_type => 'Campsite').
        where('arrival_at < ? AND departure_at > ?', departure_at, arrival_at).
        first
    end
  end

  def available_cottages
    # find all cottages
    campground.cottages.all.reject do |cottage|
      # reject cottages if it's already reserved during the requested dates
      Reservation.
        where(:bookable_id => cottage.id).
        where(:bookable_type => 'Cottage').
        where('arrival_at < ? AND departure_at > ?', departure_at, arrival_at).
        first
    end
  end

end

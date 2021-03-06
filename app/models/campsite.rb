class Campsite < ActiveRecord::Base

  belongs_to :campground
  has_many :reservations, :as => :bookable

  validates :length, :presence => true, :numericality => true
  validates :width, :presence => true, :numericality => true
  validates :amps, :presence => true, :numericality => true, :length => { :within => 0..200 }
  validates :campground, :presence => true

  def self.fitting(vehicle)
    # TODO check water,sewer,cable
    where("length >= ?", vehicle.length).where("width >= ?", vehicle.width).where("amps >= ?", vehicle.amps)
  end

end

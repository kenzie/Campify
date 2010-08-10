class Campsite < ActiveRecord::Base

  belongs_to :campground
  has_many :reservations

  validates :length, :presence => true, :numericality => true
  validates :width, :presence => true, :numericality => true
  validates :amps, :presence => true, :numericality => true, :length => { :within => 0..200 }
  validates :campground, :presence => true

end

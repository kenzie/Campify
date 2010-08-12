class Vehicle < ActiveRecord::Base

  has_many :reservations, :as => :bookee

  validates :length, :presence => true, :numericality => true
  validates :width, :presence => true, :numericality => true
  validates :amps, :presence => true, :numericality => true, :length => { :within => 0..200 }

end

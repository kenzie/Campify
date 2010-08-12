class Cottage < ActiveRecord::Base

  belongs_to :campground
  has_many :reservations, :as => :bookable

  validates :campground, :presence => true

  # bedrooms, beds (king, queen, dbl, single, pullout)
  # kitchen
  # satellite/cable
  # ac

end

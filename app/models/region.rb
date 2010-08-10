class Region < ActiveRecord::Base

  belongs_to :country
  has_many :campgrounds

  validates :country, :presence => true
  validates :name, :presence => true
  validates :abbr, :presence => true, :length => { :is => 2 }

end

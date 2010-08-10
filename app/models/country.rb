class Country < ActiveRecord::Base

  has_many :regions

  validates :name, :presence => true
  validates :abbr, :presence => true, :length => { :is => 2 }

end

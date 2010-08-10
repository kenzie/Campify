class Region < ActiveRecord::Base
  belongs_to :region
  has_many :campgrounds
end

class Campground < ActiveRecord::Base

  belongs_to :region
  has_many :campsites
  has_many :reservations

  before_save :format_postal_code

  validates :name, :presence => true
  validates :street, :presence => true
  validates :town, :presence => true
  validates :postal_code, :presence => true, :format => /^[a-zA-Z]\d[a-zA-Z]\s?\d[a-zA-Z]\d$/i
  validates :region, :presence => true

private

  def format_postal_code
    postal_code.upcase!
    postal_code.insert(3, " ") if postal_code.length == 6
  end

end

class Campground < ActiveRecord::Base

  belongs_to :region
  has_many :campsites
  has_many :cottages
  has_many :reservations

  before_validation :create_subdomain
  before_save :format_postal_code

  validates :name, :presence => true
  validates :subdomain, :presence => true
  validates :street, :presence => true
  validates :town, :presence => true
  validates :postal_code, :presence => true, :format => /^[a-zA-Z]\d[a-zA-Z]\s?\d[a-zA-Z]\d$/i
  validates :region, :presence => true

private

  def format_postal_code
    postal_code.upcase!
    postal_code.insert(3, " ") if postal_code.length == 6
  end

  def create_subdomain
    self.subdomain = name.parameterize.downcase.to_s if subdomain.nil?
  end

end

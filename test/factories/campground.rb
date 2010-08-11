Factory.define :campground do |f|
  f.name 'Sunset Sands'
  f.street '45 Wharf Rd.'
  f.town 'Port Hood'
  f.postal_code 'B0E 2W0'
  f.association :region
end
Factory.define :reservation do |f|
  f.arrival_at 7.days.from_now
  f.departure_at 12.days.from_now
  f.association :campground
  f.association :vehicle
end
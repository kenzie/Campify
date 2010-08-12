Factory.define :reservation do |f|
  f.arrival_at 7.days.from_now
  f.departure_at 12.days.from_now
  f.association :campground
  # f.association :bookable, :factory => :campsite
  # f.association :bookee, :factory => :vehicle
end

Factory.define :campsite_reservation, :class => Reservation do |f|
  f.arrival_at 7.days.from_now
  f.departure_at 12.days.from_now
  f.association :campground
  f.association :bookable, :factory => :campsite
  f.association :bookee, :factory => :vehicle
end

Factory.define :cottage_reservation, :class => Reservation do |f|
  f.arrival_at 7.days.from_now
  f.departure_at 12.days.from_now
  f.association :campground
  f.association :bookable, :factory => :cottage
  # f.association :bookee, :factory => :guest
end
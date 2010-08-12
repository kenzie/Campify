Factory.define :cottage do |f|
  f.bedrooms 2
  f.beds_king 0
  f.beds_queen 0
  f.beds_double 2
  f.beds_single 0
  f.beds_pullout 1
  f.bathrooms 1.5
  f.kitchen true
  f.satellite true
  f.air_conditioning true
  f.association :campground
end
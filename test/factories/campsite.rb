Factory.define :campsite do |f|
  f.length 10
  f.width 5
  f.amps 30
  f.water true
  f.sewer true
  f.cable true
  f.association :campground
end
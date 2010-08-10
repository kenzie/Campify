# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


ca = Country.create!(:name => 'Canada', :abbr => 'CA')
ns = ca.regions.create!(:name => 'Nova Scotia', :abbr => 'NS')

ss = ns.campgrounds.create!(:name => 'Sunset Sands', :street => '45 Wharf Rd.', :town => 'Port Hood', :postal_code => 'B0E 2W0')

c_sml = ss.campsites.create!(:length => 18, :width => 8, :amps => 30, :water => true, :sewer => true, :cable => true)
c_med = ss.campsites.create!(:length => 21, :width => 8, :amps => 30, :water => true, :sewer => true, :cable => true)
c_lrg = ss.campsites.create!(:length => 24, :width => 10, :amps => 50, :water => true, :sewer => true, :cable => true)
c_tnt = ss.campsites.create!(:length => 10, :width => 8, :amps => 30, :water => true, :sewer => false, :cable => false)
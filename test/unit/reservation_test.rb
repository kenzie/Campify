require 'test_helper'

class ReservationTest < ActiveSupport::TestCase

  def setup
    @res = Factory.build(:reservation)
  end

  test "duration of reservation" do
    @res.arrival_at = 5.days.from_now
    @res.departure_at = 7.days.from_now
    assert_equal 2, @res.duration_in_days
  end

  test "campsites that fit" do
    @res.arrival_at = 5.days.from_now
    @res.departure_at = 7.days.from_now
    cs_fit1 = Factory.create(:campsite, :campground => @res.campground)
    cs_fit2 = Factory.create(:campsite, :campground => @res.campground)
    cs_nofit1 = Factory.create(:campsite, :campground => @res.campground, :length => 4, :amps => 0)
    assert @res.available_campsites.include?(cs_fit1)
    assert @res.available_campsites.include?(cs_fit2)
    assert !@res.available_campsites.include?(cs_nofit1)
  end

end

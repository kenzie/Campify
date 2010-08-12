require 'test_helper'

class ReservationTest < ActiveSupport::TestCase

  def setup
    @res = Factory.build(:campsite_reservation)
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

  test "campsites not booked" do
    @res.arrival_at = 5.days.from_now
    @res.departure_at = 6.days.from_now
    cs = Factory.create(:campsite, :campground => @res.campground)
    rs_before = Factory.create(:reservation, :campground => @res.campground, :bookable => cs, :arrival_at => 3.days.from_now, :departure_at => 4.days.from_now)
    rs_after  = Factory.create(:reservation, :campground => @res.campground, :bookable => cs, :arrival_at => 7.days.from_now, :departure_at => 8.days.from_now)
    assert @res.available_campsites.include?(cs)
  end

  test "campsites booked (before to after)" do
    @res.arrival_at = 5.days.from_now
    @res.departure_at = 6.days.from_now
    cs = Factory.create(:campsite, :campground => @res.campground)
    rs_during = Factory.create(:reservation, :campground => @res.campground, :bookable => cs, :arrival_at => 3.days.from_now, :departure_at => 7.days.from_now)
    assert !@res.available_campsites.include?(cs)
  end

  test "campsites booked (before to middle)" do
    @res.arrival_at = 5.days.from_now
    @res.departure_at = 7.days.from_now
    cs = Factory.create(:campsite, :campground => @res.campground)
    rs_during = Factory.create(:reservation, :campground => @res.campground, :bookable => cs, :arrival_at => 3.days.from_now, :departure_at => 6.days.from_now)
    assert !@res.available_campsites.include?(cs)
  end

  test "campsites booked (middle to after)" do
    @res.arrival_at = 5.days.from_now
    @res.departure_at = 7.days.from_now
    cs = Factory.create(:campsite, :campground => @res.campground)
    rs_during = Factory.create(:reservation, :campground => @res.campground, :bookable => cs, :arrival_at => 6.days.from_now, :departure_at => 8.days.from_now)
    assert !@res.available_campsites.include?(cs)
  end

  test "book first available campsite" do
    @res.arrival_at = 5.days.from_now
    @res.departure_at = 6.days.from_now
    cs = Factory.create(:campsite, :campground => @res.campground)
    @res.bookable = cs
    @res.save
    assert_equal @res.bookable, cs
  end

  test "cottages not booked" do
    @res.arrival_at = 5.days.from_now
    @res.departure_at = 6.days.from_now
    ct = Factory.create(:cottage, :campground => @res.campground)
    rs_before = Factory.create(:reservation, :campground => @res.campground, :bookable => ct, :arrival_at => 3.days.from_now, :departure_at => 4.days.from_now)
    rs_after  = Factory.create(:reservation, :campground => @res.campground, :bookable => ct, :arrival_at => 7.days.from_now, :departure_at => 8.days.from_now)
    assert @res.available_cottages.include?(ct)
  end

end

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
    bk_fit1 = Factory.create(:campsite, :campground => @res.campground)
    bk_fit2 = Factory.create(:campsite, :campground => @res.campground)
    bk_nofit1 = Factory.create(:campsite, :campground => @res.campground, :length => 4, :amps => 0)
    assert @res.available_campsites.include?(bk_fit1)
    assert @res.available_campsites.include?(bk_fit2)
    assert !@res.available_campsites.include?(bk_nofit1)
  end

  test "campsites not booked" do
    @res.arrival_at = 5.days.from_now
    @res.departure_at = 6.days.from_now
    bk = Factory.create(:campsite, :campground => @res.campground)
    rs_before = Factory.create(:reservation, :campground => @res.campground, :bookable => bk, :arrival_at => 3.days.from_now, :departure_at => 4.days.from_now)
    rs_after  = Factory.create(:reservation, :campground => @res.campground, :bookable => bk, :arrival_at => 7.days.from_now, :departure_at => 8.days.from_now)
    assert @res.available_campsites.include?(bk)
  end

  test "campsites booked (before to after)" do
    @res.arrival_at = 5.days.from_now
    @res.departure_at = 6.days.from_now
    bk = Factory.create(:campsite, :campground => @res.campground)
    rs_during = Factory.create(:reservation, :campground => @res.campground, :bookable => bk, :arrival_at => 3.days.from_now, :departure_at => 7.days.from_now)
    assert !@res.available_campsites.include?(bk)
  end

  test "campsites booked (before to middle)" do
    @res.arrival_at = 5.days.from_now
    @res.departure_at = 7.days.from_now
    bk = Factory.create(:campsite, :campground => @res.campground)
    rs_during = Factory.create(:reservation, :campground => @res.campground, :bookable => bk, :arrival_at => 3.days.from_now, :departure_at => 6.days.from_now)
    assert !@res.available_campsites.include?(bk)
  end

  test "campsites booked (middle to after)" do
    @res.arrival_at = 5.days.from_now
    @res.departure_at = 7.days.from_now
    bk = Factory.create(:campsite, :campground => @res.campground)
    rs_during = Factory.create(:reservation, :campground => @res.campground, :bookable => bk, :arrival_at => 6.days.from_now, :departure_at => 8.days.from_now)
    assert !@res.available_campsites.include?(bk)
  end

  test "book first available campsite" do
    @res.arrival_at = 5.days.from_now
    @res.departure_at = 6.days.from_now
    bk = Factory.create(:campsite, :campground => @res.campground)
    @res.bookable = bk
    @res.save
    assert_equal @res.bookable, bk
  end

  test "cottages not booked" do
    @res.arrival_at = 5.days.from_now
    @res.departure_at = 6.days.from_now
    bk = Factory.create(:cottage, :campground => @res.campground)
    rs_before = Factory.create(:reservation, :campground => @res.campground, :bookable => bk, :arrival_at => 3.days.from_now, :departure_at => 4.days.from_now)
    rs_after  = Factory.create(:reservation, :campground => @res.campground, :bookable => bk, :arrival_at => 7.days.from_now, :departure_at => 8.days.from_now)
    assert @res.available_cottages.include?(bk)
  end

  test "cottages booked (before to after)" do
    @res.arrival_at = 5.days.from_now
    @res.departure_at = 6.days.from_now
    bk = Factory.create(:cottage, :campground => @res.campground)
    rs_during = Factory.create(:reservation, :campground => @res.campground, :bookable => bk, :arrival_at => 3.days.from_now, :departure_at => 7.days.from_now)
    assert !@res.available_cottages.include?(bk)
  end

end

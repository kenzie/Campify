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

end

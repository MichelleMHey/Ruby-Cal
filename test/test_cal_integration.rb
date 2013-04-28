require 'test/unit'
require 'cal'

class TestCal < Test::Unit::TestCase

  def test_01_header_month_year
    feb = `cal 2 2013`.split(/\n/).first.strip!
    assert_equal(feb, Calendar.new(2, 2013).month_head)
  end 

  def test_02_days_of_week_header
  	week_day = Calendar::WEEKDAY
  end

  def test_03_get_first_of_month
  end


end
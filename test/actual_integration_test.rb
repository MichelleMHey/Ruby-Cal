require 'test/unit'

class TestCal < Test::Unit::TestCase

  def test_01_header_month_year
    assert_equal(`cal 3 2013`, `ruby cal.rb 3 2013`)
  end

  def test_02_days_of_week_header
    assert_equal(`cal 5 2010`, `ruby cal.rb 5 2010`)
  end

  def test_03_leap_year
    assert_equal(`cal 2 2016`, `ruby cal.rb 2 2016`)
  end

  def test_04_get_first_of_month
    assert_equal(`cal 12 2013`, `ruby cal.rb 12 2013`)
  end

  def test_05_number_of_days
    assert_equal(`cal 7 2011`, `ruby cal.rb 7 2011`)
  end

  def test_06_calendar
    assert_equal(`cal 3 2020`, `ruby cal.rb 3 2020`)
  end

end
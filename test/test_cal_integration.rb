require 'test/unit'
require 'cal'

class TestCal < Test::Unit::TestCase

  def test_01_header_month_year
    (1..12).each do |i|
    header = `cal #{i} 2013`.split(/\n/).first.strip!
    assert_equal(header, Calendar.new(i, 2013).month_head)
    end
    (1..12).each do |i|
    header = `cal #{i} 2014`.split(/\n/).first.strip!
    assert_equal(header, Calendar.new(i, 2014).month_head)
    end
  end 

  def test_02_days_of_week_header
    week_day = Calendar::WEEKDAY
    assert_equal("Su Mo Tu We Th Fr Sa",week_day)
  end

  def test_03a_leap_year
    leap_one = Calendar.new(2, 2016)
    assert_equal(true, leap_one.is_leap_year?)
  end

  def test_03b_leap_year
    non_leap = Calendar.new(2, 2015)
    assert_equal(false, non_leap.is_leap_year?)
  end

  def test_03c_leap_year
    leap_two = Calendar.new(2, 2020)
    assert_equal(true, leap_two.is_leap_year?)
  end

  def test_04a_get_first_of_month
     assert_equal(5, Calendar.new(2, 2013).start_day_of_month)
  end

  def test_04b_get_first_of_month
     assert_equal(2, Calendar.new(8, 2023).start_day_of_month)
  end

  def test_04c_get_first_of_month
     assert_equal(1, Calendar.new(1, 1800).start_day_of_month)
  end

  def test_04d_get_first_of_month
     assert_equal(1, Calendar.new(12, 3000).start_day_of_month)
  end
  def test_05a_number_of_days
    thirty = [4, 6, 9, 11]
    thirty.each do |i|
    assert_equal(30, Calendar.new(i, 2013).num_of_days)
    end
  end

  def test_05b_number_of_days
    thirty_one = [1, 3, 5, 7, 8, 10, 12]
    thirty_one.each do |i|
    assert_equal(31, Calendar.new(i, 2013).num_of_days)
    end
  end

  def test_05c_number_of_days
    assert_equal(28, Calendar.new(2, 2013).num_of_days)
  end

  def test_05d_number_of_days
    assert_equal(29, Calendar.new(2, 2016).num_of_days)
  end

  def test_06_calendar
    year = Calendar.new(2, 2016)
    year_display = year.to_string 
    assert_equal(`cal 2 2016`, year_display)
  end

end
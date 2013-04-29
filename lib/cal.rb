class Calendar

  WEEKDAY = "Su Mo Tu We Th Fr Sa"
  MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  attr_reader :month
  attr_reader :year

  def initialize(month, year)
  	@month = month
  	@year = year
  end

  def month_head
    MONTHS[@month - 1] + " " + @year.to_s
  end

  def is_leap_year?
 	if @year % 400 == 0
 	  true
 	elsif @year % 100 == 0
 	  false
 	elsif @year % 4 == 0
 	  true
 	else
 	  false
 	end
  end

  def start_day_of_month
  end

  def to_s
  	# use num_of_day
  end

  def num_of_days
  	if [4, 6, 9, 11].include?(@month)
  		return 30
  	elsif [1, 3, 5, 7, 8, 10, 12].include?(@month)
  		return 31
  	elsif @month == 2 && is_leap_year?
  		return 29
  	else
  		return 28
  	end
  end

end
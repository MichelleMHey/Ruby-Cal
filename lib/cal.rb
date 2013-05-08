 class Calendar

  WEEKDAY = "Su Mo Tu We Th Fr Sa"
  MONTHS = ["    January", "   February", "     March", "     April", "      May", "     June", "     July", "    August", "   September", "    October", "   November", "   December"]

  attr_reader :month 
  attr_reader :year  

  def initialize(month, year)
    raise ArgumentError, 'Invalid month.' unless month.to_i.between?(1,12) 
    raise ArgumentError, 'Unsupported year.' unless year.to_i.between?(1800,3000)
    @month = month.to_i
    @year = year.to_i
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
    q = 1
    m = @month
    k = @year % 100
    if m == 2 || m == 1
      m += 12
      k = (k + 99) % 100
    end
    j = @year / 100
    #Zeller's congruence
    h = (q + ((13*(m+1))/5).floor+k+(k/4).floor+(j/4).floor+5*j) % 7
    #shift to sunday = 0
    (h + 6) % 7
  end

  def make_calendar  
    out = month_head + "\n"  
    out += WEEKDAY + "\n"
    out += (" " * 3 * start_day_of_month) 
    current_cell = start_day_of_month
    num_of_days.times do |i|
      if i < 9
        out += " " + (i + 1).to_s
      else
        out += (i + 1).to_s
      end
      current_cell += 1
      current_cell = current_cell % 7
      if current_cell == 0
        out += "\n"
      elsif i + 1 == num_of_days
        out += "\n\n"
      else
        out += " "
      end
    end
    out
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

def make_year(year)
  month_cal = []
  output = ""
  (1..12).each do |i|
    month_cal << (Calendar.new(i, year).make_calendar)
  end
  (0..3).each do |row|
    left_split = month_cal[(3*row)+0].split("\n")
      puts left_split
    middle_split = month_cal[(3*row)+1].split("\n")
      puts middle_split
    right_split = month_cal[(3*row)+2].split("\n")
      puts right_split
    left_split.size.times do |i|
      out += left_split[i].to_s + "  " + middle_split[i].to_s + "  " + right_split[i].to_s 
    end
    output += "\n\n"
  end
  output
end

  if ARGV.size == 2
    month = ARGV[0]
    year = ARGV[1]
    puts Calendar.new(month, year).make_calendar
  elsif ARGV.size == 1
    puts make_year(ARGV[0])
  elsif ARGV.size == 0
    time = Time.new
    puts Calendar.new(time.month, time.year).make_calendar
  end

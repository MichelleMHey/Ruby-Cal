require 'cal'

month = ARGV[0]
year = ARGV[1]

if ARGV.size > 0
  calendar = Calendar.new
  puts calendar.make_calendar(month,year)
end 
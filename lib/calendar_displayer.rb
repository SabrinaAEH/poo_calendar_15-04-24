require 'date'

class CalendarDisplayer
  def initialize(events)
    @events = events
  end

  def display_calendar
    puts "-----------------------------------------------------------------------"
    puts "|1        |2        |3        |4        |5        |6        |7        |"
    puts "|         |         |         |         |         |         |         |"
    puts "|         |         |         |         |         |         |         |"
    puts "|         |         |         |         |         |         |         |"
    puts "|         |         |         |         |         |         |         |"
    puts "-----------------------------------------------------------------------"
    4.times do |week|
      7.times do |day|
        print_day(week * 7 + day + 1)
      end
      puts "\n-----------------------------------------------------------------------"
    end
  end

  private

  def print_day(day_number)
    day_events = @events.select { |event| event.start_date.day == day_number }
    print "|#{day_number.to_s.rjust(2)}       "
    print_event_count(day_events.count)
    print_time(day_events.first)
    print_event_title(day_events.first)
    print "\n"
  end

  def print_event_count(event_count)
    print "|#{event_count.to_s.rjust(2)} events|"
  end

  def print_time(event)
    return print "         " if event.nil?

    print "#{event.start_date.strftime('%l:%M%P')}   "
  end

  def print_event_title(event)
    return print "         " if event.nil?

    print "#{event.title.ljust(25)}"
  end
end

# Test
class Event
  attr_accessor :start_date, :title

  def initialize(start_date, title)
    @start_date = DateTime.parse(start_date)
    @title = title
  end
end

events = [
  Event.new("2024-04-01T09:00:00", "Sandbox calendar challenge"),
  Event.new("2024-04-04T09:00:00", "Post to main"),
  Event.new("2024-04-07T09:00:00", "Profit challenge"),
  Event.new("2024-04-22T09:00:00", "Scheduled event"),
  Event.new("2024-04-27T09:00:00", "Another scheduled event"),
  Event.new("2024-04-30T19:30:00", "Halloween party")
]

calendar_displayer = CalendarDisplayer.new(events)
calendar_displayer.display_calendar


# le programme ne fonctionne pas correctement, mais je m'arrête ici :)
require "pry"
require 'time'

class Event
  attr_accessor :start_date, :duration, :title, :attendees

  def initialize(start_date_to_save, duration_to_save, title_to_save, attendees)
    @start_date = Time.parse(start_date_to_save)
    @duration = duration_to_save.to_i
    @title = title_to_save.to_s
    @attendees = attendees
  end

  def postpone_24h 
    @start_date += 24*60*60
  end

   def end_date
    @start_date + @duration 
   end

   def is_past?
    if Time.now > @start_date + @duration
      true
    else
      false
    end
  end

  def is_future?
    !is_past?
  end
  
  def is_soon?
    if @start_date > Time.now && Time.now < (@start_date - 30)
      true
    else
      false
    end
  end
  
  def to_s
    puts "Nom de l'évènement: #{@title}"
    puts "Durée: #{@duration}"
    puts "Date et heure de début: #{@start_date}"
    puts "Invités: #{@attendees}"
  end
  

end

binding.pry
puts "end of file"

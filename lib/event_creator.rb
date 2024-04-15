require "pry"

require_relative 'event'

class EventCreator

  def initialize
        @title = ""
        @start_date = ""
        @duration = ""
        @attendees = []
  end

  def run
    puts "Salut, tu veux créer un événement ? Cool !"
    set_title
    set_start_date
    set_duration
    set_attendees
    create_event
    display_event
  end

  private

  def set_title
    puts "Commençons. Quel est le nom de l'événement ?"
    @title = gets.chomp
  end

  def set_start_date
    puts "Super. Quand aura-t-il lieu ? (Format: YYYY-MM-DD HH:MM)"
    @start_date = gets.chomp
  end

  def set_duration
    puts "Au top. Combien de temps va-t-il durer (en minutes) ?"
    @duration = gets.chomp.to_i
  end

  def set_attendees
    puts "Génial. Qui va participer ? Balance leurs e-mails (séparés par des ;)"
    @attendees = gets.chomp.split(";").map(&:strip)
  end

  def create_event
    @event = Event.new(@start_date, @duration, @title, @attendees)
  end

  def display_event
    puts "Super, c'est noté, ton évènement a été créé !"
    puts @event.to_s
  end
end

EventCreator.new.run

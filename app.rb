require_relative './lib/user'
require_relative './lib/event'

# A nice menu for our calendar
class EventCreator
  @@all = []

  def initialize
    puts "Commençons la création d'un événement."
    @name_event = name_event
    @moment = moment
    @dur = dur
    @who = who
    new_event = Event.new(@moment, @dur, @name_event, @who)
    @@all << new_event
    puts "L'événement a été créé !"
  end

  def name_event
    puts "Quel est le nom de l'évenement ?"
    print '> '
    gets.chomp
  end

  def moment
    puts "Quand aura t'il lieu ?"
    print '> '
    gets.chomp
  end

  def dur
    puts "Combien de temps durera t'il ?"
    print '> '
    gets.chomp.to_i
  end

  def who
    puts 'Qui viendra ?'
    print '> '
    gets.chomp.split(';')
  end

  def self.all_events
    @@all.each do |i|
      i.to_s
      puts
    end
  end

  def self.event_by_name(name)
    @@all.each do |i|
      if i.title == name
        i
      end
    end
  end
end

julie = User.new('julie@gmail.com', 32)
jean = User.new('jean@jean.com', 25)

brunch = Event.new('2021-05-05 11:00', 60, 'brunch', [julie, jean])

brunch.age_analysis

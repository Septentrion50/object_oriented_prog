require 'pry'
require 'time'

# a calendar
class Event
  attr_accessor :start_date, :duration, :title, :attendees, :end_date

  def initialize(date, duration, title, attendees)
    @start_date = check_date_format(date)
    @duration = conv_minutes(duration)
    @title = check_title(title)
    @attendees = check_attendees(attendees)
    @end_date = calc_end_date
  end

  def read_start_date
    @start_date
  end

  def update_start_date(new_start)
    @start_date = check_date_format(new_start)
  end

  def read_duration
    @duration
  end

  def update_duration(new_dur)
    @duration = conv_time(new_dur)
  end

  def read_end_date
    @end_date
  end

  def read_title
    @title
  end

  def update_title(new_title)
    @title = check_title(new_title)
  end

  def read_attendees
    @attendees
  end

  def update_attendees(new_att)
    @attendees = check_attendees(new_att)
  end

  def postpone_24h
    @start_date += 24 * 60 * 60
  end

  def is_past?
    return true if (@start_date <=> @now) == -1

    false
  end

  def is_future?
    if !is_past?
      true
    else
      false
    end
  end

  def is_soon?
    thirty_mins = 30 * 60
    now = Time.now
    delta = @start_time <=> (now + thirty_mins)
    return true if delta == -1 || delta == 0

    false
  end

  def send_reminder
    if is_soon?
      puts "sending a reminder to #{@attendees.join(' ')}"
    end
  end

  def to_s
    puts "Titre : #{@title}"
    puts "Date de début : #{@start_date.strftime('%Y-%m-%d %H:%M')}"
    puts "Durée : #{@duration / 60} minutes"
    puts "Invités : #{@attendees.join(' ')}"
  end

  private

  def check_date_format(date)
    Time.parse(date)
  rescue ArgumentError
    puts 'Please enter a correct date format : YYYY-mm-dd HH:MM'
  end

  def conv_minutes(minutes)
    minutes * 60
  rescue ArgumentError
    puts 'Please enter a correct duration format : Number of minutes'
  end

  def calc_end_date
    @start_date + @duration
  end

  def check_title(title)
    if title.class != String
      'Please enter a correct title'
    else
      title
    end
  end

  def check_attendees(att)
    if att.class != Array
      'Please enter a list of attendees'
    else
      att
    end
  end
end

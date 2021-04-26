require 'pry'

# a user
class User
  attr_accessor :email, :age

  @@all = []

  def initialize(email_to_save, age)
    @email = email_to_save
    @age = age
    @@all << self
  end

  def self.all
    return @@all
  end

  def self.find_by_email(email)
    @@all.each do |u|
      if email == u.email
        return u
      end
    end
  end

  def show_itself
    print "Voici l'instance : "
    puts self
  end

  def update_email(email_to_update)
    @email = email_to_update
  end

  def read_email
    return @email
  end

  def update_age(age_to_update)
    @age = age_to_update
  end

  def read_age
    return @age
  end

  private

  def check_email(email)
    email.match?(/(.+)@(.+)\.([a-z]+)/)
  end
end

puts 'end of file'

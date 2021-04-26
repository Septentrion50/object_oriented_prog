require 'pry'

# a user
class User
  attr_writer :mastercard
  attr_reader :birth_date
  attr_accessor :email

  @@user_count = 0

  def initialize(email_to_save)
    @email = email_to_save
    puts 'On envoie un email de bienvenue !'
    @@user_count += 1
  end

  def self.count
    return @@user_count
  end

  def greet
    puts 'Bonjour, monde !'
  end

  def say_hello_to_someone(first_name)
    puts "Bonjour, #{first_name} !"
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

  def read_mastercard
    return @mastercard
  end

  def update_birthdate(birthdate_to_update)
    @birth_date = birthdate_to_update
  end

  private

  def check_email(email)
    email.match?(/(.+)@(.+)\.([a-z]+)/)
  end
end

binding.pry
puts 'end of file'

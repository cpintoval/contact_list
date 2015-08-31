require_relative 'contact'
require_relative 'contact_database'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets
class Application

  def initialize

  end

  # Main method to 
  def run
    arg = ARGV[0]
    case arg
    when 'help'
      puts "Here is a list of available commands:"
      puts "    new  - Create a new contact"
      puts "    list - List all contacts"
      puts "    show - Show a contact"
      puts "    find - Find a contact"
    end
  end

end

# Creation of an Application instance and running it
app = Application.new
app.run
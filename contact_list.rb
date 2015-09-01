require_relative 'contact'
require_relative 'contact_database'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets
class Application

  def initialize

  end

  # Main method to run the app
  def run
    arg = ARGV[0]
    case arg
    when 'help'
      puts "Here is a list of available commands:"
      puts "    new  - Create a new contact"
      puts "    list - List all contacts"
      puts "    show - Show a contact"
      puts "    find - Find a contact"
    when 'new'
      puts "Enter contact's full name: "
      full_name = $stdin.gets.chomp
      puts "Enter contact's email: "
      email = $stdin.gets.chomp
      puts "New contact created with id: #{Contact.create(full_name, email)}"
    when 'list'
      list = Contact.all
      if list.length != 0
        list.each do |item|
          puts "#{item[0]}: #{item[1]} (#{item[2]})"
        end
        puts "---"
        puts "#{list.length} records total"
      else
        puts "No contacts stored in database"
      end
    when 'show'
      id = ARGV[1]
      if !id.nil? && !id.empty?
        result = Contact.show(id)
        if result != []
          puts "Name: #{result[1]}"
          puts "Email: #{result[2]}"
        else
          puts "Not found"
        end
      else
        puts "Need to specify id to show"
      end
    when 'find'
      term = ARGV[1]
      if !term.nil? && !term.empty?
        result = Contact.find(term)
        if result != []
          puts "Name: #{result[1]}"
          puts "Email: #{result[2]}"
        else
          puts "Not found"
        end
      else
        puts "Need to specify term to search"
      end
    end
  end

end

# Creation of an Application instance and running it
app = Application.new
app.run
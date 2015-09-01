#!/usr/bin/env ruby
require_relative 'contact'
require_relative 'contact_database'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets
class Application

  # Main method to run the app
  def self.run
    arg = ARGV[0]
    case arg
    when 'help'
      puts "Here is a list of available commands:"
      puts "    new  - Create a new contact"
      puts "    list - List all contacts"
      puts "    show - Show a contact"
      puts "    find - Find a contact"
    when 'new'
      puts "Enter contact's email: "
      email = $stdin.gets.chomp
      if !Contact.exists?(email)
        puts "Enter contact's full name: "
        full_name = $stdin.gets.chomp
        puts "Add phone numbers (yes/no)?"
        cmd = $stdin.gets.chomp
        if cmd.downcase == "yes"
          numbers = {}
          while true
            puts "Enter label for the phone number: "
            label = $stdin.gets.chomp
            puts "Enter phone number: "
            number = $stdin.gets.chomp
            numbers[label] = number
            puts "Add another one? (yes/no)"
            cmd = $stdin.gets.chomp
            if cmd.downcase == "no"
              break
            end
          end
          puts "New contact created with id: #{Contact.create(full_name, email, numbers)}"
        else
          puts "New contact created with id: #{Contact.create(full_name, email)}"
        end
      else
        puts "Contact already exists in the database"
      end
    when 'list'
      list = Contact.all
      if list.length != 0
        list.each do |item|
          output = "#{item[0]}: #{item[1]} (#{item[2]})"
          i = 3
          while item[i] != nil
            arr = item[i].split(":")
            output += " - #{arr[0].capitalize}: #{arr[1]}"
            i += 1
          end
          puts output
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
          i = 3
          while result[i] != nil
            arr = result[i].split(":")
            puts "#{arr[0].capitalize}: #{arr[1]}"
            i += 1
          end
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
          i = 3
          while result[i] != nil
            arr = result[i].split(":")
            puts "#{arr[0].capitalize}: #{arr[1]}"
            i += 1
          end
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
Application.run
class Contact
 
  attr_accessor :name, :email, :numbers

  def initialize(name, email, numbers = {})
    @name = name
    @email = email
    @numbers = numbers
  end
 
  def to_s
    "#{@name} (#{email})"
  end
 
  ## Class Methods
  class << self
    def create(name, email, numbers = {})
      # TODO: Will initialize a contact as well as add it to the list of contacts
      new_instance = Contact.new(name, email, numbers)
      ContactDatabase.add(new_instance)
    end
 
    def find(term)
      ContactDatabase.find(term)
    end
 
    def all
      ContactDatabase.all
    end
    
    def show(id)
      ContactDatabase.show(id)
    end

    def exists?(email)
      ContactDatabase.exists?(email)
    end
    
  end
 
end
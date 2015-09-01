class Contact
 
  attr_accessor :name, :email

  def initialize(name, email)
    @name = name
    @email = email
  end
 
  def to_s
    "#{@name} (#{email})"
  end
 
  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      new_instance = Contact.new(name, email)
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
    
  end
 
end
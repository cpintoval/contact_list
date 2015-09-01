## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase

  @@file_path = "contacts.csv"

  class << self
    def add(contact)
      new_id = gen_id
      CSV.open(@@file_path, "a") { |csv| csv << ["#{new_id}", "#{contact.name}", "#{contact.email}"] }
      new_id
    end

    def all
      contacts_array = CSV.read(@@file_path)
    end

    def show(id)
      contacts_array = CSV.read(@@file_path)
      contacts_array.each do |contact|
        if contact[0] == id
          return contact
        end
      end
      []
    end

    def find(term)
      contacts_array = CSV.read(@@file_path)
      contacts_array.each do |contact|
        if contact[1].include?(term) || contact[2].include?(term)
          return contact
        end
      end
      []
    end

    def exists?(email)
      contacts_array = CSV.read(@@file_path)
      contacts_array.each do |contact|
        if contact[2] == email
          return true
        end
      end
      false
    end

    protected
    def gen_id
      contacts_array = CSV.read(@@file_path)
      contacts_array.length == 0 ? 10 : "1#{contacts_array[-1][0][1..-1].to_i + 1}"
    end

  end

end
require_relative 'entry'
require "csv"
require '/home/john/bloc/bloc_record/lib/bloc_record/base'

class AddressBook < BlocRecord::Base

  def add_entry(name, phone, email)
    Entry.create(name: name, phone_number: phone, email: email, address_book_id: self.id)
  end

  def entries
    Entry.where(address_book_id: self.id)
  end

  def find_entry(name)
    Entry.where(name: name, address_book_id: self.id).first
  end

  def find_order
    Entry.order(name: :asc)
  end

  def import_from_csv(file_name)
    # Implementation goes here
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end


end

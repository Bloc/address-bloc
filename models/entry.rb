require 'bloc_record/base'

class Entry < BlocRecord::Base
  belongs_to :address_book

  def to_s
    "Name: #{name}\nPhone Number: #{phone_number}\nEmail: #{email}"
  end
end

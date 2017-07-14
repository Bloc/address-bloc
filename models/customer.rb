require 'bloc_record/base'

class Customer < BlocRecord::Base 
  def to_s
    "Name: #{name}"
  end
end

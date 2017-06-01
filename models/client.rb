require 'bloc_record/base'

class Client < BlocRecord::Base 
  def to_s
    "Name: #{name}"
  end
end

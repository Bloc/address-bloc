require 'bloc_record/base'

class Loan < BlocRecord::Base 
  def to_s
    "Name: #{name}, Type: #{type}, Amount: #{amount}"
  end
end

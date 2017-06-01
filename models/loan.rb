require 'bloc_record/base'

class Loan < BlocRecord::Base 
  def to_s
    "Name: #{name}"
  end
end

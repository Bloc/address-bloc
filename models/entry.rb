require 'bloc_record/base'

class Entry < BlocRecord::Base

  def to_s
    "Name: #{name}\nPhone Number: #{phone_number}\nEmail: #{email}"
  end

  def self.method_missing(method, *args, &block)
    value_and_parameter = ""
    value = ""
    parameter = ""
    method.to_s
    method.match(/^find_by_(.*)$/) { |match| value_and_parameter = match }
    value_and_parameter.match(/^\w*/) { |match| value = match }
    value_and_parameter.match(/"(\w*)/) { |match| parameter = match }
    Entry.find_by(:value, parameter)
  end
end

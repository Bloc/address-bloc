require_relative '../models/entry'
require 'bloc_record'
 
BlocRecord.connect_to('db/address_bloc.sqlite')

puts "\nEntry.destroy() #{Entry.destroy()}\n\n"

puts "** Entry.where(\"substr(name, 1, 1) = 'J'\") **"
puts Entry.where("substr(name, 1, 1) = 'J'")
puts "\ndestroying above records ...\n\n"
puts "Is successful? #{Entry.where("substr(name, 1, 1) = 'J'").destroy_all}"

puts "\n** Show All After Destroy **"
puts Entry.all
puts "\n\n\n"

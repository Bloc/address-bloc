require_relative '../models/address_book'
require_relative '../models/entry'
require_relative '../models/client'
require_relative '../models/customer'
require_relative '../models/loan'
require 'bloc_record'
 
BlocRecord.connect_to('db/address_bloc.sqlite')

# puts "\n/*** Find ID = 1 ***/"
# puts Entry.find(1)

# puts "\n/*** Find (Jane Smith) ***/"
# puts Entry.find_by("name", "Jane Smith")

# puts "\n/*** Find First ***/"
# puts Entry.first

# puts "\n/*** Find Last ***/"
# puts Entry.last

# puts "\n/*** Find All ***/"
# Entry.all.each do |entry|
# 	puts "\n#{entry.to_s}"
# end

# puts "\n\n/****** Validation ******/"
# puts "\nFind(3, \"4\")"
# puts Entry.find(3, "4")

# puts "\nTake(-3)"
# puts Entry.take(-3)

# puts "\n\n"

# puts "Testing missing methods\n"
# puts Entry.find_by_name("Jane Smith")
# puts "\n"
# puts Entry.find_by_phone_number("321-456*7890")
# puts "\n"
# Entry.find_name("no_method") rescue false
# puts "\n"
# Entry.locate("no_method") rescue false
# puts "\n"

# puts "\n***** Begin test find_each() *****\n"
# puts "\nEntry.find_each() {} - should return 6 records"
# Entry.find_each() do |entry|
# 	puts entry
# end

# puts "\nEntry.find_each(start: 2, batch_size: 3) {} - should return 3 records"
# Entry.find_each(start: 2, batch_size: 3) do |entry|
# 	puts entry
# end

# puts "\nEntry.find_each(start: 3) {} - should return 3 records"
# Entry.find_each(start: 3) do |entry|
# 	puts entry
# end

# puts "\nEntry.find_each(batch_size: 3) {} - should return 3 records"
# Entry.find_each(batch_size: 3) do |entry|
# 	puts entry
# end


# puts "\n\n***** Begin test find_in_batches() *****\n"
# puts "\nEntry.find_in_batches(start: 0, batch_size: 4) {} "
# puts "- should return 6 records"
# puts "- 4 records in batch 1"
# puts "- 2 records in batch 2"
# Entry.find_in_batches(start: 0, batch_size: 4) do | entries, batch |
# 	puts "--> In batch #{batch}"
# 	entries.each do | entry |
# 		puts entry
# 	end
# end

# Entry.order(:phone_number, name: :desc).each do |entry|
# 	puts entry
# end

# puts Client.join({customer: :loan}, :address_book)
# puts Client.join(:customer, :address_book)
# puts Client.join(:customer)
Client.join({customer: :loan}, {address_book: :entry})
puts Client.where('entry.email IS NULL')
puts ""
puts Client.join().where('name IS NOT NULL')

# puts Client.columns.map{ |a| "client.#{a}" }.join ", "




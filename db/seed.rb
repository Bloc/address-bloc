require_relative '../models/address_book'
require_relative '../models/entry'
require_relative '../models/client'
require_relative '../models/customer'
require_relative '../models/loan'
require 'bloc_record'
 
BlocRecord.connect_to('db/address_bloc.sqlite')

client = Client.create(name: 'Walmart')
	book = AddressBook.create(client_id: client.id, name: 'My Address Book')
		Entry.create(address_book_id: book.id, name: 'Star Lord', phone_number: '369-825-0147', email: 'star_lord@guardians.com' )
		Entry.create(address_book_id: book.id, name: 'Luke Skywalker', phone_number: '111-111-1111', email: 'luke.skywalker@rebels.com' )
		Entry.create(address_book_id: book.id, name: 'Jack N. Jill', phone_number: '222-222-2222', email: 'jack.jill@rhymes.com' )
		Entry.create(address_book_id: book.id, name: 'Jane Smith', phone_number: '321-456*7890', email: 'jane.smith@cia.com' )
		Entry.create(address_book_id: book.id, name: 'John Doe', phone_number: '987-654-3210', email: 'john_doe@morgue.com' )
		Entry.create(address_book_id: book.id, name: 'Tom Riddle', phone_number: '147*852-9630', email: 'tom_riddle@hogwarts.com' )
		Entry.create(address_book_id: book.id, name: 'Voldemort', phone_number: '147*852-9630', email: 'voldemort@hogwarts.com' )
	customer = Customer.create(client_id: client.id, name: 'John')
		loan = Loan.create(customer_id: customer.id, name: 'AR')
		loan = Loan.create(customer_id: customer.id, name: 'IN')
		loan = Loan.create(customer_id: customer.id, name: 'TL')
	customer = Customer.create(client_id: client.id, name: 'Jane')
		loan = Loan.create(customer_id: customer.id, name: 'LR')
		loan = Loan.create(customer_id: customer.id, name: 'LC')
		loan = Loan.create(customer_id: customer.id, name: 'OO')
	customer = Customer.create(client_id: client.id, name: 'Smith')
		loan = Loan.create(customer_id: customer.id, name: 'EQ')
		loan = Loan.create(customer_id: customer.id, name: 'RE')
		loan = Loan.create(customer_id: customer.id, name: 'BP')




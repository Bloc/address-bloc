require_relative '../models/address_book'
require_relative '../models/entry'
require_relative '../models/client'
require_relative '../models/customer'
require_relative '../models/loan'
require 'bloc_record'
 
BlocRecord.connect_to('db/address_bloc.sqlite')

client = Client.create(name: 'Walmart', address_1: '1 main plaza drive', city: 'trash heap', state: 'zz', zip: '98765-4321')
	book = AddressBook.create(client_id: client.id, name: 'My Address Book')
		Entry.create(address_book_id: book.id, name: 'Star Lord', phone_number: '369-825-0147', email: 'star_lord@guardians.com' )
		Entry.create(address_book_id: book.id, name: 'Luke Skywalker', phone_number: '111-111-1111', email: 'luke.skywalker@rebels.com' )
		Entry.create(address_book_id: book.id, name: 'Jack N. Jill', phone_number: '222-222-2222', email: 'jack.jill@rhymes.com' )
		Entry.create(address_book_id: book.id, name: 'Jane Smith', phone_number: '321-456*7890', email: 'jane.smith@cia.com' )
		Entry.create(address_book_id: book.id, name: 'John Doe', phone_number: '987-654-3210', email: 'john_doe@morgue.com' )
		Entry.create(address_book_id: book.id, name: 'Tom Riddle', phone_number: '147*852-9630', email: 'tom_riddle@hogwarts.com' )
		Entry.create(address_book_id: book.id, name: 'Voldemort', phone_number: '147*852-9630', email: 'voldemort@hogwarts.com' )
	customer = Customer.create(client_id: client.id, name: 'John', region: 'west', branch: 'twofive')
		loan = Loan.create(customer_id: customer.id, name: 'Receivables', type: 'AR', amount: 79845.23)
		loan = Loan.create(customer_id: customer.id, name: 'Inventory and Equipment', type: 'IN', amount: 455125.99)
		loan = Loan.create(customer_id: customer.id, name: 'Term', type: 'TL', amount: 75000)
	customer = Customer.create(client_id: client.id, name: 'Jane', region: 'east', branch: 'sixsix', control: '01')
		loan = Loan.create(customer_id: customer.id, name: 'Letter of Credit', type: 'LR', amount: 250000)
		loan = Loan.create(customer_id: customer.id, name: 'Purchase Guaranty', type: 'LC', amount: 300000)
		loan = Loan.create(customer_id: customer.id, name: 'Swingline', type: 'OO', amount: 125000)
	customer = Customer.create(client_id: client.id, name: 'Smith', region: 'east', branch: 'doublezero')
		loan = Loan.create(customer_id: customer.id, name: 'Machinery', type: 'EQ', amount: 729831.93)
		loan = Loan.create(customer_id: customer.id, name: 'Real Estate', type: 'RE', amount: 2411259.44)
		loan = Loan.create(customer_id: customer.id, name: 'Participation', type: 'BP', amount: 50)




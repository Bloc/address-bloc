require 'sqlite3'

db = SQLite3::Database.new "db/address_bloc.sqlite"

db.execute("DROP TABLE client");
db.execute("DROP TABLE customer");
db.execute("DROP TABLE loan");
db.execute("DROP TABLE address_book;");
db.execute("DROP TABLE entry;");

sql = <<-SQL 
	CREATE TABLE client (
		id INTEGER PRIMARY KEY,
		name VARCHAR(30),
		title VARCHAR(30),
		address_1 VARCHAR(50),
		address_2 VARCHAR(50),
		city VARCHAR(50),
		state VARCHAR(2),
		zip VARCHAR(10)
	);
SQL
db.execute sql

sql = <<-SQL 
	CREATE TABLE customer (
		id INTEGER PRIMARY KEY,
		client_id INTEGER,
		name VARCHAR(30),
		region VARCHAR(10),
		branch VARCHAR(10),
		control VARCHAR(3),
		industry VARCHAR(8),
		FOREIGN KEY (client_id) REFERENCES client(id)
	);
SQL
db.execute sql

sql = <<-SQL 
	CREATE TABLE loan (
		id INTEGER PRIMARY KEY,
		customer_id INTEGER,
		name VARCHAR(30),
		type VARCHAR(2),
		amount REAL,
		FOREIGN KEY (customer_id) REFERENCES customer(id)
	);
SQL
db.execute sql


sql = <<-SQL 
	CREATE TABLE address_book (
		id INTEGER PRIMARY KEY,
		client_id INTEGER,
		name VARCHAR(30),
		FOREIGN KEY (client_id) REFERENCES client(id)
	);
SQL
db.execute sql

sql = <<-SQL 
	CREATE TABLE entry (
		id INTEGER PRIMARY KEY,
		address_book_id INTEGER,
		name VARCHAR(30),
		phone_number VARCHAR(30),
		email VARCHAR(30),
		FOREIGN KEY (address_book_id) REFERENCES address_book(id)
	);
SQL
db.execute sql






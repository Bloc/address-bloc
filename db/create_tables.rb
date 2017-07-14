require 'sqlite3'
require 'pg'
require_relative 'config'

module PG
	class Connection
		def execute(sql)
			self.exec(sql).values
		end
	end
end

arg = ARGV[0]
if arg.to_s == 'pg'
	db = PG::Connection.new(options(arg))
	id_type = 'BIGSERIAL'
else
	db = SQLite3::Database.new options(arg)
	id_type = 'INTEGER'
end

db.execute("DROP TABLE entry;");
db.execute("DROP TABLE address_book;");
db.execute("DROP TABLE loan");
db.execute("DROP TABLE customer");
db.execute("DROP TABLE client");

sql = <<-SQL 
	CREATE TABLE client (
		id #{id_type} PRIMARY KEY,
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
		id #{id_type} PRIMARY KEY,
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
		id #{id_type} PRIMARY KEY,
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
		id #{id_type} PRIMARY KEY,
		client_id INTEGER,
		name VARCHAR(30),
		FOREIGN KEY (client_id) REFERENCES client(id)
	);
SQL
db.execute sql

sql = <<-SQL 
	CREATE TABLE entry (
		id #{id_type} PRIMARY KEY,
		address_book_id INTEGER,
		name VARCHAR(30),
		phone_number VARCHAR(30),
		email VARCHAR(30),
		FOREIGN KEY (address_book_id) REFERENCES address_book(id)
	);
SQL
db.execute sql






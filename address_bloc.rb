require_relative 'controllers/menu_controller'
require_relative 'db/config'
require 'bloc_record'

arg = ARGV[0]
# puts "ARGV[0]: #{arg}"
# puts "connect_to: #{options(arg)}, #{arg}"
# BlocRecord.connect_to("db/address_bloc.sqlite", :sqlite3)
BlocRecord.connect_to(options(arg), arg)

menu = MenuController.new
system "clear"
puts "Welcome to AddressBloc!"
menu.main_menu

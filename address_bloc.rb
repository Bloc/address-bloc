require_relative 'controllers/menu_controller'
require '/home/john/bloc/bloc_record/lib/bloc_record'

BlocRecord.connect_to("db/address_bloc.sqlite")

menu = MenuController.new
system "clear"
puts "Welcome to AddressBloc!"
menu.main_menu

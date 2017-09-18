require_relative 'controllers/menu_controller'
require 'bloc_record'

BlocRecord.connect_to("address_bloc", :pg)

menu = MenuController.new
system "clear"
puts "Welcome to AddressBloc!"
menu.main_menu

class DomesticCat
  def jump(thisHigh)
    puts "I jumped #{thisHigh}"
  end
end

class WildCat
  def leap(howHigh)
    puts "I leaped #{thisHigh}"
  end
end

catType = :wild

if catType == :domestic
  cat = DomesticCat.new
elsif catType == :wild
  cat = WildCat.new
end

cat.jump("really high")

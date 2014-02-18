require_relative '../config/environment'

puts "What is your address?"

address = gets.chomp

restaurants = NearbyRestaurants.new("#{address}")
# restaurants = NearbyRestaurants.new("11 Broadway 10004")


restaurant_id = restaurants.random_merchant

restaurant_name = restaurants.lookup_merchant(restaurant_id.to_s)

menu = Menu.new(restaurant_id)

puts " ------------------------------------------------"
puts "Your Random Selection from #{restaurant_name}:"
puts menu.choose_an_item
puts menu.choose_an_item
puts menu.choose_an_item


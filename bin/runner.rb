require_relative '../config/environment'

puts "What is your address?"

address = gets.chomp

restaurants = NearbyRestaurants.new("#{address}")

restaurant_id = restaurants.random_merchant

menu = Menu.new(restaurant_id)

puts menu.wholemenu
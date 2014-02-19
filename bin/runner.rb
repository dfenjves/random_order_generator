require_relative '../config/environment'

puts "What is your address?"

address = gets.chomp

puts "How many items do you want to order?"

item_number = gets.chomp.to_i

restaurants = NearbyRestaurants.new("#{address}")
# restaurants = NearbyRestaurants.new("11 Broadway 10004")


restaurant_id = restaurants.random_merchant
restaurant_name = restaurants.lookup_merchant_name(restaurant_id.to_s)
restaurant_url = restaurants.lookup_merchant_url(restaurant_id.to_s)

menu = Menu.new(restaurant_id)

puts " ------------------------------------------------"
puts "Your Random Selection from #{restaurant_name}:"

item_number.times do
	puts menu.choose_an_item
end

puts "Go to #{restaurant_url} to place your order"

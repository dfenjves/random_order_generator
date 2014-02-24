require_relative '../config/environment'

repeat = "yes"
puts "What is your address?"
address = gets.chomp

while repeat == "yes" do

	puts "How many items do you want to order?"
	item_number = gets.chomp.to_i

	puts "Max price per dish:"
	max_per_dish = gets.chomp.to_i


	restaurants = NearbyRestaurants.new("#{address}")
	# restaurants = NearbyRestaurants.new("11 Broadway 10004")


	restaurant_id = restaurants.random_merchant
	restaurant_name = restaurants.lookup_merchant_name(restaurant_id.to_s)
	restaurant_url = restaurants.lookup_merchant_url(restaurant_id.to_s)

	menu = Menu.new(restaurant_id, max_per_dish)

	puts " ------------------------------------------------"
	puts "Your Random Selection from #{restaurant_name}:"

	item_number.times do
		puts menu.choose_an_item
	end

	puts "-------------------------------------------------"
	puts "Go to #{restaurant_url} to place your order"



	puts "Try again?"
	repeat = gets.chomp
end
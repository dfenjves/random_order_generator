require_relative '../config/environment'

repeat = "yes"

while repeat == "yes" do
	user_answers = Opener.new

	restaurants = NearbyRestaurants.new("#{user_answers.address}")
	# restaurants = NearbyRestaurants.new("11 Broadway 10004")


	restaurant_id = restaurants.random_merchant
	restaurant_name = restaurants.lookup_merchant_name(restaurant_id.to_s)
	restaurant_url = restaurants.lookup_merchant_url(restaurant_id.to_s)

	menu = Menu.new(restaurant_id)

	puts " ------------------------------------------------"
	puts "Your Random Selection from #{restaurant_name}:"

	user_answers.item_number.times do
		puts menu.choose_an_item
	end

	puts "-------------------------------------------------"
	puts "Go to #{restaurant_url} to place your order"



	puts "Try again?"
	repeat = gets.chomp
end
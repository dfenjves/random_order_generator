require_relative '../config/environment'

puts "What is your address?"

address = gets.chomp

test = NearbyRestaurants.new("#{address}")

puts test.random_merchant
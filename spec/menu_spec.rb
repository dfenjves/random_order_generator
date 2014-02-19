require_relative 'spec_helper'

describe Menu do

	rest1 = Menu.new("71432")

	it 'displays the menu for a given restaurant id' do
		expect(rest1.wholemenu.join).to match(/Chicken Yaki Udon/)
	end

	# it 'displays a hash with food names and prices' do
	# 	expect(rest1.food_and_prices).to eq(food and prices hash)
	# end

	# it 'selects a random item from the menu' do
	# 	expect(rest1.random_item).to eq(random item from the menu)
	# end

end
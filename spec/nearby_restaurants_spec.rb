require_relative 'spec_helper'

describe NearbyRestaurants do
	
	rest_spaces = NearbyRestaurants.new("11 Broadway 10004")
	rest_commas = NearbyRestaurants.new("11 Broadway, New York, NY 10004")

	it 'accepts an address with spaces'  do
		expect(rest_spaces.restaurants.count).to be >(0)
	end

	it 'accepts an address with commas' do
		expect(rest_commas.restaurants.count).to be >(0)
	end

	it 'returns a list of restaurants nearby' do
		expect(rest_commas.restaurants.count).to be >(0)
	end

	it 'returns a list of merchant ids' do
		expect(rest_commas.ids.count).to be >(0)
	end

	it 'returns a random merchant id' do
		expect(rest_commas.random_merchant.to_i).to be >(0)
	end

end


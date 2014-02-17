require_relative 'spec_helper'

describe NearbyRestaurants do
	
	rest = NearbyRestaurants.new("11 Broadway 10004")

	it 'returns a list of restaurants nearby' do
		expect(NearbyRestaurants.list.count).to be >(0)
	end

end
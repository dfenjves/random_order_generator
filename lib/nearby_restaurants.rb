#returns nearby restaurants given address

class NearbyRestaurants
	attr_accessor :address, :restaurant_data, :restaurants, :names

	def initialize(address)
		@address = address.gsub(" ", "%20")
		self.restaurant_data = RestClient.get("https://api.delivery.com/merchant/search/delivery?client_id=OWQ0NGNiNGVlY2JmZWVlYWMxYzQwMWJlNjUxYTY2ZTc3&address=#{@address}&merchant_type=R")
	end


	def restaurants
		self.restaurants = JSON.parse(restaurant_data)
	end

	def ids
		@ids = []

		restaurants["merchants"].each do |merchant|
			merchant.each do |data_name, data|
				@ids << data if data_name == "id"
			end
		end

		@ids
	end

	def names
		self.restaurants
	end

end
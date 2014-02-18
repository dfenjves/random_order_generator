#returns nearby restaurants given address

class NearbyRestaurants
	attr_accessor :address, :restaurant_data, :restaurants, :names, :merchants

	def initialize(address)
		@address = address.gsub(" ", "%20")
		self.restaurant_data = RestClient.get("https://api.delivery.com/merchant/search/delivery?client_id=OWQ0NGNiNGVlY2JmZWVlYWMxYzQwMWJlNjUxYTY2ZTc3&address=#{@address}&merchant_type=R")
		self.restaurants = JSON.parse(restaurant_data)
		merchants
	end

	def merchants
		@merchants = []

		restaurants["merchants"].each do |merchant|
			@merchants << merchant
		end

		@merchants
	end

	def random_merchant
		@merchants[rand(0..(merchants.count-1))]["id"]
	end

	def lookup_merchant(id)
		specific_merchant = @merchants.select do |merchant|
			merchant if merchant["id"] == id
		end
		specific_merchant.first["summary"]["name"]
	end

end
returns nearby restaurants given address

class NearbyRestaurants
	attr_accessor :address

	def initialize(address)
		self.address = address
	end

	def get_data
		RestClient.get('')
	end	

end

class Opener
	attr_accessor :address, :item_number
	def initialize

		puts "What is your address?"
		@address = gets.chomp
		puts "How many items do you want to order?"
		@item_number = gets.chomp.to_i

	end

end
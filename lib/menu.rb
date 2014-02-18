class Menu
	attr_accessor :data, :wholemenu, :items

	def initialize(restaurant_id)
		self.data = JSON.parse(RestClient.get("https://api.delivery.com/merchant/#{restaurant_id}/menu?client_id=OWQ0NGNiNGVlY2JmZWVlYWMxYzQwMWJlNjUxYTY2ZTc3&item_only=1"))
		self.wholemenu = data["menu"]
		get_menu_items
	end

#eventually figure out recursion here
	def get_menu_items
		@items =[]
		wholemenu.each do |item|
			@items << item if item["children"].count == 0
			if item["children"].count > 0
				item["children"].each do |child2|
					@items << child2 if child2["children"].count == 0
					if child2["children"].count >  0
						child2["children"].each do |child3|
							@items << child3 if child3["children"].count ==0
							if child3["children"].count > 0
								child3["children"].each do |child4|
									@items << child4 if child4["children"].count == 0
								end
							end
						end
					end
				end
			end
		end
		@items
	end

	# USING WHILE LOOPS? 
	# def get_menu_items
	# 	@items = []
	# 	wholemenu.each do |item|
	# 		while item["children"].count > 0
	# 			item["children"].each
	# 	end
	# end

	def choose_an_item
		choice = @items[rand(0..(@items.count-1))]
		item_formatter(choice)
	end

	def item_formatter(food)
		"#{food["name"]} ------ $#{food["price"]}"
	end

end
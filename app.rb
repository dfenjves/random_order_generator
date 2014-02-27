class ROGApp < Sinatra::Base
 configure :development do
    register Sinatra::Reloader
 end

get '/' do
	erb :main
end

post '/' do
	address = params[:address]
	quantity = params[:items].to_i
	max = params[:maxprice].to_i

	@order = RandomOrderGenerator.new(address,quantity,max)

	erb :result
end



end
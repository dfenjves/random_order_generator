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

	begin
		@order = RandomOrderGenerator.new(address,quantity,max)
	rescue
		erb :badaddress
	else
		erb :result
	end
	
end



end
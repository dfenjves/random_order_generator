class ROGApp < Sinatra::Base
 configure :development do
    register Sinatra::Reloader
 end
 enable :sessions

	get '/' do
		erb :main
	end

	post '/' do
		session[:address] = params[:address]
		session[:quantity] = params[:items].to_i
		session[:max] = params[:maxprice].to_i

		begin
			@order = RandomOrderGenerator.new(session[:address],session[:quantity],session[:max])
		rescue
			erb :badaddress
		else
			erb :result
		end
		
	end

	get '/moar' do
		@order = RandomOrderGenerator.new(session[:address],session[:quantity],session[:max])
		erb :result
	end



end
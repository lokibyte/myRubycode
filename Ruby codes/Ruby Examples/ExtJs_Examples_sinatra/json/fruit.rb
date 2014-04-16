require 'rubygems'
require 'sinatra'
require 'slim'
require 'json'
require 'sinatra/session'

set :public_folder,'public'
enable :sessions

get '/' do
	# session["result"]=102
	slim :Fruit
end

post '/AddWord' do


	item=params[:item]
	rate=params[:rate]
	qty=params[:qty]
	
	
	puts "..........................."
	
	# session["result"]= params
	# puts session[:data]
	# puts "........... #{session}"
	# p @request.methods
	# puts "hdjfjdfdsfjhdf"
	
	# @request.cookies["params"]=params
	# @request.session["params"]
	
	
resp = {
			'success' => true,
			'message' => "Submitted Item name =#{item},rate =#{rate},and Quantity =#{qty}"
			}
		
	 resp.to_json
 
	
end

get '/list' do

	
puts ".........................................."
p @@a

resp = {
			'success' => true,
			'data' => @@a
			}
		
			return resp.to_json
	 

end
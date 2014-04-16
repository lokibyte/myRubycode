require 'rubygems'
require 'sinatra'
require 'slim'

@@fruits = ['apple', 'banana']

get '/result/:fruit/:quantity' do
	if params[:fruit] == 'apple'
		result = 3 * params[:quantity].to_i
	elsif params[:fruit] == 'banana'
		result = 5 * params[:quantity].to_i
	elsif @@fruits.include? params[:fruit]
		result = 100 * params[:quantity].to_i
	else
		result = "fruit not found"
	end
	
	result.to_s
end

get '/fruit' do
	
	slim :fruit
end

post '/fruit' do
	@@fruits.push(params[:fruit])
	@@fruits.inspect
end

__END__


@@fruit
form method='post' action='/fruit'
	label for='fruitname' Fruit Name
	input id='fruitname' type='text' name='fruit'
	input type='submit'
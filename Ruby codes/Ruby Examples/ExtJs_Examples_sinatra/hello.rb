require 'rubygems'
require 'sinatra'
require 'slim'


Slim::Engine.set_default_options :pretty => true
@@msg=nil
@@mg=nil


get '/' do

	slim :Empl

end

post '/' do

item =	params[:item]
qty =params[:Qty]
puts qty.class

	price = 100 * qty.to_i
	@@mg="Rate=#{price}"
	
@@msg ="thank you for Buying!!!!! VISIT AGAIN"

redirect '/'

end
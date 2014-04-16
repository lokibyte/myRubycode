require 'rubygems'
require 'sinatra'
require 'slim'
require 'json'

disable :logging

set :public_folder, 'public'


get '/' do
	slim :index
end

post '/word' do
	p params
	puts "\n\n\t\tadded word\n\n"
	
	# return {
		# 'success'	=> false,
		# 'message'	=> 'word already exists'
	# }.to_json
	
	return {
		'success'	=> true,
		'message'	=> 'word added successfully'
	}.to_json
end
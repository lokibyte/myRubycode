require 'rubygems'
require 'sinatra'
require 'slim'

get '/' do
	slim :index
end

post '/word' do
p params
end
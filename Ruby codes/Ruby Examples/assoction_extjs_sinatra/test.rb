require 'rubygems'
require 'sinatra'
require 'slim'
require 'sequel'
require 'json'

set :public_folder, 'public'

DB = Sequel.sqlite('dictionary.sqlite')

if DB.table_exists? :master
	DB.drop_table(:master)
end


DB.create_table? (:master) do
	primary_key	:id
	String		:name
end

DB.create_table? (:details) do
	primary_key	:id
	String		:dname
	foreign_key	:master_id,	:movies
end

class Master < Sequel::Model(DB[:master]) 

end


get '/' do
	slim:index
end

get '/data' do
	arr=[]
	master.each do |d|
		arr.push(d.values)
	end
	
	p arr	
	
	return {
	
		'success' =>true,
		'value' => arr
	}.to_json

end

post '/data' do
	data = JSON.parse(request.body.read)
	table = master.new(
		 :name => data['name'],
		 :usn  => data['usn']
	).save
	
	return {
		'success' => true,
		'value'  => table.values
	}.to_json
	
end
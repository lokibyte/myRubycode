require 'rubygems'
require 'sinatra'
require 'slim'
require 'json'
require 'sequel'

set :public_folder, 'public'


DB = Sequel::sqlite('dictionary.sqlite')

# Table 1-- :name_tab

DB.create_table? (:name_tab) do
	primary_key	:id		
	String		:email 
	String		:first
	String		:last
	
end

class Tab < Sequel::Model(:name_tab)  
end

get'/' do
slim:index
end


post '/create' do
puts"\n\n\nputttttttttttiiiiiiiiiiinnnnnnngggggg"


				#******** if we r using REST we have to use JSON.parse(request.body.read) for parsing data from client 
				#********* if we are using other proxy we can get data using params

# p params # displays {"_dc"=>"1345898195301"}

# p request.body  #  '#<StringIO:0xbeb9a8>'
	
	data = JSON.parse(request.body.read)['data'] 	#  {"data"=>{"id"=>nil, "email"=>"a", "first"=>"b", "last"=>"c"}} from client side
	# dtt = dt['data']
	# email = dtt['email']
	# first = dtt['first']
	# last = dtt['last']


		ds = Tab.new(
			:email => data['email'],
			:first => data['first'],
			:last => data['last']
		).save
	
	arr = []

	Tab.each do |r| arr.push r.values end

		ret = {

			'success' => true,
			# 'operation'=>'successfull',
			'data'=> {
				'id' => ds.id # sending this 'id' as key id to client side for upgrade in store & grid
			}
		}

		return ret.to_json
	


end

 

get '/read' do
puts "in create block================================="

	 Tab.all
	

	arr = []
		Tab.each do |r|
			arr.push r.values
		end

	res = {

		'success' => true,
		'message'=>'successfull',
		'data'=> arr
	}

	return res.to_json

end
require 'rubygems'
require 'sinatra'
require 'slim'
require 'json'
require 'sequel'

set :public_folder, 'public'
disable :logging

DB = Sequel::sqlite('dictionary.sqlite')

# Table 1-- :words

DB.create_table? (:dict_table) do
	primary_key	:id		
	String		:words 
	String		:meanings
	
end




# Model 'Represents one record from table :dict_table' 

class Word < Sequel::Model(:dict_table)  
end




# first display index page for get request page from client 
#it's just for getting resources(information) from server ,
# get method is used to getting page from server .. so server send index.slim page to browser when client/user requesting 'http://localhost:4567/' as URI

get '/' do
puts 'get index page'
	slim :index
end

	#******** TESTING PURPOSE**************########

	# get '/add' do
		# puts "add getingggggggggg"
		# str = [{'word' => 'aa','meaning' => 'a meaning'},{'word' => 'bb','meaning' => 'b meaning'}]

		# ret = {
			# 'success' => true,
			# 'data' => str

		# }

		# return ret.to_json

	# end

#if user want to add something in to server resources i.e posting some data in to serrver resources 'POST' method is come to ficture.this changes the server side contents

# add a word

# post '/add' do
post '/list' do


	puts " in post block-=============="
	p JSON.parse(request.body.read);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	## basic learning code
	# p params
	# word	= params[:word]
	# meaning	= params[:meaning]
	# dup_word = Word[:words=> word]
	
	
		
		# if dup_word 
				
			# resp = {
				# 'success' => false,
				# 'message'=> 'Word already present!! try with Another word',
				
			# }
			
		# else
			
			# dictn =	Word.insert(
				# :words		=>	word,
				# :meanings	=>	meaning
			# )
			
			# resp = {
				# 'success' => true,
				# 'message' => 'Word added successfully',
			
			# }
				
		# end
		
		# return resp.to_json
end
		
# delete a word

# post'/delete' do

# p params
	
	# word	= params[:word]
	
	# dict_word = Word.filter(:word => word)
	
	# if dict_word
		# dict_word.delete
		# resp = {
				# 'success' => true,
				# 'message' => 'Word deleted successfully',
			
			# }
		
	# else
		# resp = {
				# 'success' => false,
				# 'message'=> 'Word not present!! try with Another word',
				
			# }
	# end

	# return resp.to_json


# end




# list words and meanings

		
get '/list' do
puts "in /list block............"
	ds = Word.all
	p ds
	arr =[]
	
	Word.each do |r|
		arr.push r.values
	end
	
	ret = {

		'success' => true,
		'data' => arr
	}

	return ret.to_json


end
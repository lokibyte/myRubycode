require 'rubygems'
require 'sinatra'
require 'slim'
require 'json'
require 'sequel'

DB = Sequel::sqlite('dictionary.sqlite')

# Table 1-- :words

DB.create_table? (:dict_table) do
	primary_key	:id		
	String		:words 
	String		:meanings
	
end

class Word < Sequel::Model(:dict_table)  
end

disable :logging

set :public_folder, 'public'

get '/'do
slim:index
end















































































# get '/' do
	# slim :index
	
# end


# post '/add' do

	# p params
	
	# word	= params[:word]
	# meaning	= params[:meaning]
	
	
	
	# dup_word = Word[:words=> word]
	
	# if dup_word 
			
		# resp = {
			# 'success' => false,
			# 'message'=> 'Word already present!! try with Another word'
		# }
		
	# else
		
		# dictn =	Word.insert(
			# :words		=>	word,
			# :meanings	=>	meaning
		# )
		
		# resp = {
			# 'success' => true,
			# 'message' => 'Word added successfully'
		# }
			
	# end
	
	# return resp.to_json
# end



# get '/words' do
	# allwords = []
	
	# Word.each do |w|
		# allwords.push(w.values)
	# end
	# {
		# 'success' 	=> true,
		# 'value'		=> allwords
	# }.to_json
# end

# get '/' do

	# slim :index
	
	# return {
		# 'success' => true,
		# 'value'	=> 'word searched'
	# }.to_json
# end









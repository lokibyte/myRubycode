require 'rubygems'
require 'sinatra'
require 'slim'
require 'sequel'
enable :method_override
disable :logging

set :public_folder, 'public'

DB = Sequel.sqlite('dictionary.sqlite')

DB.create_table? (:words) do
	String		:word
	String		:meaning
end

word_table = DB[:words]	 #data set

class Word < Sequel::Model(:words)  #class :it represents one row i.e one record in a table
end



@@message = nil
@@messageS =nil
@@messageD = nil
@@messageE = nil
@@messageA = nil
# @@message = nil

# @@dictionary = {}
# 1. list all words
# 2. take and word and give it's meaning
# 3. add word & meaning
# 4. modify word / meaning
# 5. delete word

get '/' do
	slim :index
end






#### add words
get '/add' do

	slim :form
	
end

put '/add' do

	word = params[:word].strip # srpips off new line/blank the input from form data 
	mean = params[:meaning]
	
	p params
	
	d_word	= Word.filter[:word => word]
	
		if d_word
		
			@@message=" '#{word}' present!!!!! \t try with another word"
		
		else
			Word.insert(:word=> word,:meaning=> mean)
			
			
			# Word.new(params).save # use 'params' only wen both variables declared here and 'form_data' be identical 
			#if we use this querry we get "can't convert in to array to string server ERR"
			
		end
	
	redirect '/add'
	
end




#### search the words

get '/search' do
	slim:search
end

get '/searching' do

	

	search=params[:search]
	
	d_word = Word.filter(:word => search).first #take a record and search for parameter 'search' assign found word in to d_word
	
	if d_word
		@@messageS=" ' #{d_word.word} ' Meaning  is : '#{d_word.meaning}'"
	else
		@@messageS = "Word not found"
	end
			
			slim:search		
	
end








##### modify / edit the word

get '/modify' do
puts "gettting=========="
	slim :modify
end

put '/modify' do
puts " putting--------"
	word = params[:word]
	mean = params[:meaning]
puts  params
	dict_word = Word.filter(:word => word).all
# p dict_word
			# dict_word = word_table.filter(:word => word).first
p dict_word
			# dict_word_query = Word.filter(:word => word)
			# dict_word		= dict_word_query.first

			# dict_word_query = word_table.filter(:word => word)
			# dict_word		= dict_word_query.first

	
	
	if dict_word
		
		ds = Word.filter(:word => word).update(:meaning => mean)
		p ds
		@@messageE = "updated successfully"
	else
		@@messageE = "Word not found!!!!!! plz add new word"
	end	
	
	
	# redirect '/modify'
	
end








##### delete the word

get '/delet' do
	slim :delet
end

post '/delet' do
	word = params[:word]
	
	dict_word = Word.filter(:word => word)
	
	if dict_word
		dict_word.delete
	else
		@@messageD = "Word not found"
	end

	redirect '/delet'

end




require 'yaml'

###### list all the words

get '/list' do
	if Word.empty?
		@@message="List is  empty"
	else
		ds=word_table.all.to_yaml
		@@message="The list of words in Dictionary are #{ds}"
	
	end
	
	slim :list
end









# get '/hello/:name' do
	# "Hello, #{params[:name].upcase}"
# end


# REST - REpresentational State Transfer
# C	- Create		- POST
# R	- Read			- GET
# U	- Update		- PUT
# D	- Delete		- DELETE
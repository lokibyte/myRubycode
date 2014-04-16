require 'sinatra'
require 'slim'
require 'sequel'
require 'json'

set :public_folder ,'public'

DB = Sequel::sqlite('new_database.sqlite')

# table1
 
DB.create_table?(:table1) do 
	primary_key :id
	String		:word
	String		:meaning
	
end

#table2

DB.create_table?( :table2 ) do 
	primary_key	:id
	String 			:meanings
# foriegn_key 	:word_id, :table1,  :allow_null=> false # err wrong no of arguments due to spelling wrong in foreign_key
	foreign_key		:word_id, :table1, :allow_null => false
	
end




class Word < Sequel::Model(:table1)
one_to_many :meanings,
	:key => :word_id,
	:class => :Meanings
end

class Meanings < Sequel::Model(:table2)
many_to_one :word,
	:key => :word_id,
	:class => Word
end

get '/' do
slim:index
end


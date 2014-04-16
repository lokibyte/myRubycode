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
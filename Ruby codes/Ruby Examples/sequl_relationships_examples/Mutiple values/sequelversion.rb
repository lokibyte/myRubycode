%w(rubygems sequel yaml).each {|a| require a }

# Database
DB = Sequel.sqlite # ('G:\Ruby\MyWork\sequel\Database\dictionary.sqlite')

DB.create_table? :words do
	primary_key :id
	String 		:word
end

DB.create_table? :meanings do
	primary_key :id
	String 		:meaning
	foreign_key	:word_id,
				:words,
				:null => false
end

wordid = DB[:words].insert(:word => 'a')

DB[:meanings].insert(:meaning => 'j', :word_id => wordid)

# puts "------------------------"
# DB[:words].each do |w|
	# p w
# end
# puts "========================"

# puts "------------------------"
# DB[:meanings].each do |m|
	# p m
# end
# puts "========================"





























word = 'a'

w = DB[:words].filter(:word => word).first

p w[:id]
p w[:word]


m = DB[:meanings].filter(:word_id => w[:id]).first
p m[:id]
p m[:meaning]


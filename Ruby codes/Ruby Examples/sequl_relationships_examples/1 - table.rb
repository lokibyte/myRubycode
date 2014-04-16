%w(rubygems sequel yaml).each { |lib| require lib }

DB = Sequel.sqlite

DB.create_table? :users do
	primary_key	:id
	String		:name
end

DB[:users].insert(
	:name => 'jithu'
)
DB[:users].insert(
	:name => 'lokesh'
)

# puts "------------------"
# DB[:users].each do |user|
	# p user
# end
# puts "=================="
	
array = []

DB[:users].each do |user|
	array.push(user)
end

puts "------------------"
p array
puts "=================="
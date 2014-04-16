%w(rubygems sequel yaml).each { |lib| require lib }

DB = Sequel.sqlite # ('classes.sqlite')

DB.create_table? :users do
	primary_key	:id
	String		:name,
				:unique => true
end

class User < Sequel::Model(:users)
end


begin

	j = User.new(:name => 'jithu').save
	j2 = User.new(:name => 'jithu').save
	# l = User.new(:name => 'lokesh').save

rescue => e
	puts "\n\n\t #{e.message}\n\n"
end

array = []

User.all.each do |user|
	array.push(user.values)
end

puts "------------------"
p array
puts "=================="
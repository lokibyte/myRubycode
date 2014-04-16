require 'rubygems'
require 'sequel'


database = Sequel::sqlite('database.sqlite')


tags = database[:tags]

# puts "----- before -----"
# puts studs.all

# studs.insert(:name => 'efgh')

# # a = studs[:name => 'efgh']
# # p a
# # studs.filter(:name => 'efgh').delete
# studs.filter(:name => 'efgh').update(:age => 11)
# # puts a.inspect
# # a.delete(:name)
# # p a


class Student < Sequel::Model(database[:tags])
end


# astudent = Student.new(:name => 'abcd')
# astudent.save

# bstudent = Student.find(:name => 'efgh')
# puts bstudent.id
# puts bstudent.name

# Student.each do |student|
	# puts "--- student -- #{student.name} -- #{student.id} -- #{student.age} ---"
# end

# totalages = 0
# Student.each do |stud|
	# totalages = totalages + stud.age
# end
# p totalages

p "average"
# p totalages/Student.count

p database[:students].avg(:age)

# puts "----- after -----"
# puts studs.all
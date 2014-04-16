require 'rubygems'
require 'sequel'

DB = Sequel.sqlite('sample.sqlite')

DB.create_table? (:tab1) do
	primary_key 	:id	
	String 		:name 
	Integer :num
	
end


DB.create_table? (:tab2) do
	primary_key 	:id	
	String 			:name 
	Integer 		:num
	
end


# DB.alter_table(:tab1) do
	# add_column	:age, Integer, :default => 0
# end



class Tab < Sequel::Model (DB[:tab2])
	# def validate
		# super
		# errors.add(:name, 'cannot be longer than 5 chars') if name.length > 5
		# errors.add(:num, 'cannot be larger than 99999') if num > 99999
	# end
end



# a = Tab.new(:name=>'abc235678', :num => 123123123123213)
# p a.valid?
# p a.errors





# DB.alter_table(:tab1) do
  # drop_column :age
# end






# DB.alter_table(:tab1) do
  # rename_column :class,:section
# end



# adding primary key

# DB.alter_table(:tab1) do
  # add_primary_key :num
  # end


dataset=DB[:tab2]

# aa=Tab.new(:name=> 1,:age=>10,:class=>'II')
# aa.save
# Tab.each do |r| p r.id end
# Tab.new(:name=>'abc2', :num => 123123123123213,).save
res = dataset.all
p res
# p res.values


# each_pair demo

# res.each do |k|
# k.each_pair{ |r,v| puts "#{r}------#{v}" }
# end

printf "%6s %8s \n", "name", "num"


str=''
res.each do |k|

	k.each_pair do  |r,v|

		# str << r << v
		printf "%8s ", v

	end
	
	printf "\n"
end
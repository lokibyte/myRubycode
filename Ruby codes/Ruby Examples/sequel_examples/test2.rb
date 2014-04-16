require 'rubygems'
require 'sequel'


database = Sequel::sqlite('database.sqlite')

# Table 1-- :standards

database.create_table? (:standards) do
	primary_key	:id		
	String		:name
end


# Table  2 -- :students

database.create_table? (:students) do
	primary_key	:id		
	String		:name
	Integer		:age, :default => 0
	foreign_key	:std_id, :standards
end


#Table 3 --- :exp


database.create_table? (:exp) do
	Integer		:id
	String		:name1	,:unique=> true
	# String 		:buggy
	primary_key [:id, :name1] ,:unique=> true
check{char_length(name1) > 2}

	
end


# Classes 

	class Standard < Sequel::Model(database[:standards])
		one_to_many :students, :key => :std_id, :class => :Student
	end



	class Student < Sequel::Model(database[:students])
		# many_to_one :standard, :key => :std_id, :class => :Standard
	end



	class Exp < Sequel::Model(database[:exp])
		# many_to_one :standard, :key => :std_id, :class => :Standard
	end

	
#*** ADD  COLUMN NAME

	# database.alter_table(:exp) do
		# add_column	:name2,String, :default=> 0
	# end


#*** DROP COLUMN NAME

	# database.alter_table(:exp) do
		# drop_column	:name3
	# end
	

#*** RENAME COLUMN NAME
	
	# database.alter_table(:exp) do
		# rename_column	:name2, :name3
	# end

	
#***** ADD add_foreign_key column to :exp table
	
	# database.alter_table(:exp) do
		# add_foreign_key	:id2, :standards
	# end


#***** set_column_default demo
	
	database.alter_table(:exp) do
		set_column_default	:id2, 0
	end	

#***** set_column_type demo
	
	database.alter_table(:exp) do
		set_column_type	:id2, String
	end



# Exp.filter(:id=> 4).each {|r| p r}  # select * from Exp where id=4
p Exp.table_name
ps= Student[1]		# retrive primary key 'ds' is the model instance of Exp
# puts  ps.pk			# retrive ps primary key
# p ps.values
ds=Exp.set(:name2=>'loki123')
Exp.filter(:name2=>'loki123').each {|r| p r}
	# e.g # items.literal(:items__price)


# Exp.insert(:id => 2, :name1 => 'abc') 


astud = Student.find(:name => 'abc')

# p astud.name

# p astud.standard.name

# puts "-- Following are all classmates of standard '#{astud.standard.name}' --"
# astud.standard.students.each do |classmate|
	# p classmate.name
# end





#*************************************************


# Student.each { |r| p r.name}  #enumarable intreface



# p Student.to_hash(:id,:name) # convert to hash use 2 as key &value pair
# p Student.to_hash_groups(:id,:name)




# p1= Exp.where(:name1.like('%e'))  #name end with 'e'
# p1.each {|r| p r}



# p Exp.get(:name1)  #geting one value associated with :name1 LIMIT 1

# ps= database[:exp].with_sql("select * from :exp1")

# p database.empty?   			# wrong
# a=database[:exp].empty?  # correct 
# p Exp.empty?			#checking for empty record in databse
# p a




#    AGGRIGATE FUNCTIONS*********************


# p database[:standards].count  #returns no of records in table :standards

# p Exp.sum(:id)			  #returns sum of id
# p Exp.max(:id)				#returns MAX of id
# p Exp.min(:id)				#returns MiN of id
# p Exp.avg(:id)				#returns AVG of id




# demo of 'FROM' clause

	# ps= Standard.from(:standards,:students)
	# ps.each {|r| p r}


# p Exp.insert(:id=>6,:name1=> 'Bob').values
# Exp.new(:buggy => 'Bob1')
 # Exp[:name1].values
# p Exp.columns  # returns columns
# p Exp.db_schema  #returns EXP schema


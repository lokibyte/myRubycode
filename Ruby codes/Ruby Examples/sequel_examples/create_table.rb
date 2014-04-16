require 'rubygems'
require 'sequel'


# database = Sequel::sqlite('database.sqlite')
database = Sequel.connect('sqlite://database.sqlite')

database.create_table? (:tabl1) do
	primary_key	:id
	String		:name
end


database.create_table? (:tabl2) do
	primary_key	:sid
	String		:name
	Integer		:age, :default => 0
	foreign_key	:std_id, :tabl1
end

class Tab < Sequel::Model(database[:tabl1]) 
end



class Tab2 < Sequel::Model(database[:tabl2]) 
end

Tab.new(:name=>'a1').save
Tab.new(:name=>'a2').save
Tab2.new(:name=>'a21',:age=>10,).save
Tab2.new(:name=>'a22').save


# database.alter_table(:students) do
	# add_column	:age, Integer, :default => 0
# end





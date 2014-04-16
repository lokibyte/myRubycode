require 'rubygems'
require 'sequel'


database = Sequel::sqlite('database.sqlite')
# database = Sequel::sqlite

# Table 1-- :managers

database.create_table? (:managers) do
	primary_key		:id		
	String			:name
end


# Table  2 -- :employees

database.create_table? (:employees) do
	primary_key		:id		
	String			:name
	foreign_key		:mgr_id, :managers, :allow_null => false
end


mgr_table = database[:managers]
emp_table = database[:employees]

mgr1	= mgr_table.insert(:name => 'mgr_aaa')
mgr2	= mgr_table.insert(:name => 'mgr_bbb')


emp1	= emp_table.insert(:name => 'emp_mmm', :mgr_id => mgr1)
emp2	= emp_table.insert(:name => 'emp_nnn', :mgr_id => mgr1)
emp3	= emp_table.insert(:name => 'emp_ppp', :mgr_id => mgr2)
emp4	= emp_table.insert(:name => 'emp_qqq', :mgr_id => mgr2)



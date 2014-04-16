require 'rubygems'
require 'sequel'


database = Sequel::sqlite('database.sqlite')


mgr_table = database[:managers]
emp_table = database[:employees]

#******** solution 1



# emp_table.each do |emp|
	# emp_mgr_id =  emp[:mgr_id]
	# mgr = mgr_table.filter(:id => emp_mgr_id).first

	# puts "#{emp[:id]} == #{emp[:name]} == #{mgr[:name]}"
# end




#******** solution 2

mgr_table.each do |mgr| 

	mgr_num = mgr[:id]
	# p mgr_num

	emp = emp_table.filter(:mgr_id => mgr_num)

	emp.each do |r| 

		puts "#{r[:id]}======#{r[:name]}====#{mgr[:name]}"

	end
 
end
	

 #  output
 
# [E:\Ruby\sequel\associations]ruby test_table.rb
# 1
# 1======emp_mmm====mgr_aaa
# 2======emp_nnn====mgr_aaa
# 2
# 3======emp_ppp====mgr_bbb
# 4======emp_qqq====mgr_bbb


#******** 		***********************************



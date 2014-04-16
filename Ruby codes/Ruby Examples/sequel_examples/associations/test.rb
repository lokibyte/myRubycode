require 'rubygems'
require 'sequel'


database = Sequel::sqlite('database.sqlite')



class Employee < Sequel::Model(database[:employees])
	many_to_one	:manager,
				:key	=> :mgr_id,
				:class	=> :Manager
end


class Manager < Sequel::Model(database[:managers])
	one_to_many	:employees,
				:key	=> :mgr_id,
				:class	=> :Employee
end



# Manager.each do |mgr|
	# puts mgr.name
	# puts "--------------"
	# mgr.employees.each do |emp|
	# puts "#{emp.id} == #{emp.name}"
	# end
	# puts "=============="
# end
Employee.each do |emp|
	puts "#{emp.id} == #{emp.name} == #{emp.manager.name}"
end

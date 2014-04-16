require 'sequel'
require 'rubygems'

# DB=Sequel::sqlite('association_demo_ds.sqlite')
DB=Sequel::sqlite()


#======= house_table
DB.create_table?(:house) do
	primary_key	:id
	String		:name
	
end

DB.create_table?(:residents) do
	primary_key	:id
	String		:name
foreign_key	:house_id,	:house,	:allow_null=>false
end


house = DB[:house]
resident = DB[:residents]

h_id = house.insert(:name=>'house1')
h2_id = house.insert(:name=>'house2')

# house.each do |h|

	# p h[:id]
	# p h[:name]

# end


r1 = resident.insert(:name=>'res1',:house_id=>h_id)
r2 = resident.insert(:name=>'res2',:house_id=>h_id)
r3 = resident.insert(:name=>'res4',:house_id=>h2_id)
r4 = resident.insert(:name=>'res3',:house_id=>h2_id)


#**********-======== without class i.e code  beneath the model 


#===== getting resident records**---1
resident.each do |r|
	hs_id = r[:house_id]
	hs = house.filter(:id => hs_id).first
	puts " #{r[:name]}- stays in --#{hs[:name]}"
end


#===== getting resident records through House table**---2

# house.each do |h|
	# resident.each do |r|
		# if (r[:house_id]== h[:id])
			# puts "#{h[:name]}=====#{r[:name]}"
		# end			 
	# end
# end



#===== getting resident records through House table**---3

# house.each do |h|
	# matching_residents = resident.filter(:house_id=>h[:id]).all
		# matching_residents.each do |r| 
			# puts "#{h[:name]}=====#{r[:name]}"
		# end
# end


#********* vehicles table**---

DB.create_table?(:vehicles) do
	primary_key	:id
	String	:name
end

vehicle = DB[:vehicles]
v1 = vehicle.insert(:name=>'scooty')
v2 = vehicle.insert(:name=>'vespa')

# vehicle.each do |v| 
	# p v[:name]
	# p v[:res_id]
# end


#********* res_vehicle table ***** join_table

DB.create_table?(:res_vehicles) do
	primary_key:id
	foreign_key	:res_id,	:residents,	 :allow_null=>false
	foreign_key	:v_id,		:vehicles,	:allow_null=>false
	
end

rv = DB[:res_vehicles]
rv1 = rv.insert(:res_id=>r1,:v_id=>v1)
rv2 = rv.insert(:res_id=>r2,:v_id=>v2)
rv3 = rv.insert(:res_id=>r1,:v_id=>v2)
 
 # rv.each do |r|
	# v = vehicle.filter(:id=>r[:v_id]).all
	# v.each do |x|
		# rs = resident.filter(:id=>r[:res_id]).all
		# rs.each do |y|
			# puts "#{y[:name]}is owner of #{x[:name]}"
		# end
	# end 
 
 # end
 
# puts "the owners of vehicle v1 are"

v = vehicle.filter(:id=>1).all
v.each do |v|
	rrv =  rv.filter(:v_id => v[:id]).all
	rrv.each do |rrv|
		res = resident.filter(:id => rrv[:res_id]).all
		res.each do|r|
			p r[:name]
			h = house.filter(:id => r[:house_id])
			p h[:name]
		end
	end
end 


puts "the owners of vehicle v2 are"
v = vehicle.filter(:id=>2).all
v.each do |v|
	rrv =  rv.filter(:v_id=>v[:id]).all
	rrv.each do |rrv|
		res = resident.filter(:id=>rrv[:res_id]).all
		res.each do|r|
			h = house.filter(:id=>r[:house_id]).first
			p r[:name]
			p h[:name]
		end
	end
end 






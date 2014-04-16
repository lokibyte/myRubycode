require 'sequel'
require 'rubygems'

# DB=Sequel::sqlite('association_demo_ds.sqlite')
DB=Sequel::sqlite()


#======= house_table
DB.create_table?(:house) do
	primary_key	:id
	String		:name
end

#======= residents table
DB.create_table?(:residents) do
	primary_key	:id
	String		:name
	foreign_key	:house_id,	:house,	:allow_null=>false
end


#********* vehicles table**---

DB.create_table?(:vehicles) do
	primary_key	:id
	String	:name
end


#********* res_vehicle table ***** join_table

DB.create_table?(:res_vehicles) do
	primary_key:id
	foreign_key	:res_id,	:residents,	 :allow_null=>false
	foreign_key	:v_id,		:vehicles,	:allow_null=>false
end


class House < Sequel::Model(DB[:house])
	one_to_many :residents,
				:key	=> :house_id,
				:class	=> :Resident
end


class Resident < Sequel::Model(DB[:residents])
	many_to_one :house,
				:key	=> :house_id,
				:class	=> :House
	many_to_many	:vehicles,
					:left_key=>:res_id,
					:right_key=>:v_id,
					:join_table=>:res_vehicles,
					:class => :Vehicle
end


class Vehicle < Sequel::Model(DB[:vehicles])
	many_to_many	:residents,
					:left_key=>:v_id,
					:right_key=>:res_id,
					:join_table=>:res_vehicles,
					:class=> :Resident
end

h1 = House.new(:name=>'house1').save()
h2 = House.new(:name=>'house2').save()
p h1
# p h1.name
# p h1.id

# puts 
# puts "=====In house table-====="
# House.each do |h|
	# puts"#{h.id}=====#{h.name}"
# end

# puts"===== In Resident with their house========="
r1 = Resident.new(:name=>'Res1')
r1.house = h1
r1.save()

r2 = Resident.new(:name=>'Res2')
r2.house = h2
r2.save()

r3 = Resident.new(:name=>'Res3')
r3.house = h2
r3.save()

r4 = Resident.new(:name=>'Res4')
r4.house = h1
r4.save()

# h1.add_resident(r1)
# h1.add_resident(r4)

# h2.add_resident(r2)
# h2.add_resident(r3)

# puts r3.name
# puts r3.house_id

# Resident.each do |r|
	# puts" #{r.id}=====#{r.name}= stays in ==#{r.house.name}"
# end



# House.each do |h|
	# h.residents.each do |r|
		# puts "In #{ h.name}====#{r.name}-- are staying"
	# end
# end


v1 = Vehicle.new(:name=>'scooty').save()
v2 = Vehicle.new(:name=>'honda').save()
v3 = Vehicle.new(:name=>'hero').save()
# p v1.name
puts "vehicle names"
Vehicle.each do |v|
	p v.name
end

#  insertion into joining table method-1

# r1.add_vehicle(v1)
# r2.add_vehicle(v2)
# r3.add_vehicle(v3)
# r4.add_vehicle(v1)

#   or
#  insertion into joining table method-2

v1.add_resident(r1)
v2.add_resident(r2)
v3.add_resident(r3)
v1.add_resident(r1)

puts "==============="
vscooty = Vehicle.filter(:name=>'scooty').first


Resident.each do |r|
	r.vehicles.each do |v|
		puts" #{r.name}-stays in- #{r.house.name} & having- #{v.name}"
	end
end


puts "==============="
House.each do |h|
	v_count = 0
	h.residents.each do |r|
		v_count += r.vehicles.count
	end
	puts "#{h.name} has #{v_count} vehicles"
end
















#******* not required here due to we are adding vehicle id in above code i'e object basis
# rv =DB[:res_vehicles]
# rv1 = rv.insert(:res_id=>r1.id,:v_id=>v1.id)
# rv2 = rv.insert(:res_id=>r2.id,:v_id=>v2.id)
# rv3 = rv.insert(:res_id=>r3.id,:v_id=>v3.id)
# rv4 = rv.insert(:res_id=>r4.id,:v_id=>v1.id)

# rv.each do |r|
	# puts"resident_id : #{r[:res_id]} ====vehicle_id: #{r[:v_id]}"
# end

# puts "owners of scooty are"
# vscooty = Vehicle.filter(:name=>'scooty').first
# p vscooty

# res_veh = rv.filter(:v_id=>vscooty.id).all
# res_veh.each do |rv|
	# p rv[:res_id]
	# residents = Resident.filter(:id=>rv[:res_id]).first
	# house = House.filter(:id=>residents.id).first
	# puts"#{ residents.name}"
	
# end

















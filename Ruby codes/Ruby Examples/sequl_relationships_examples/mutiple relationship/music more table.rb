%w(rubygems sequel yaml).each {|a| require a }

# DB = Sequel.sqlite ('G:\Ruby\MyWork\sequel\Database\mutiple relationship\Music data.sqlite')
DB = Sequel.sqlite

DB.create_table? :movies do

	primary_key :id
	string 		:movie_name,
				:null => false
	
end

DB.create_table? :songs do

	primary_key :id
	string 		:title,
				:null => false
	
	foreign_key	:movie_id
		
end

DB.create_table? :singers do

	primary_key :id
	string 		:singer_name
	
	
		
end


DB.create_table? :singers_songs do

	primary_key :id
	foreign_key	:singer_id,
				:singers,
				:null => false
	foreign_key	:song_id,
				:songs,
				:null => false			
		
end

m 	= DB[:movies]
s 	= DB[:songs]
si	= DB[:singers]
ss  = DB[:singers_songs]

x = m.insert(:movie_name => "test")
puts "--------- x -------------"
p x

y = s.insert(:title => 'aaa', :movie_id => x)

puts "--------- y -------------"
p y
puts "--------- z -------------"
z = si.insert(:singer_name => "raj")
z1 = si.insert(:singer_name => "tom")
puts z

a = ss.insert(:singer_id => z ,:song_id => y)
a1 = ss.insert(:singer_id => z1,:song_id => y)

puts "--------- a -------------"
puts a



puts "--------- songs -------------"
s.each do |song|
	e = m.filter(:id => song[:movie_id]).first
	w = ss.filter(:song_id => song[:id]).first
	
	si.each do |sin|
		puts	"song = #{song[:title]}  movie = #{e[:movie_name]} and singer = #{sin[:singer_name]}"
	end
end	
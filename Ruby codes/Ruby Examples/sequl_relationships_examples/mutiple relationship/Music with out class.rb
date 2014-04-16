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
	
	foreign_key	:movie_id,
				:movies#,
				# :null => false
		
end

# DB.create_table? :singers do

	# primary_key :id
	# string 		:singer_name
	
	
		
# end


# DB.create_table? :singers_songs do

	# primary_key :id
	# foreign_key	:singer_id,
				# :singers,
				# :null => false
	# foreign_key	:song_id,
				# :songs,
				# :null => false			
		
# end

m 	= DB[:movies]
s 	= DB[:songs]

x = m.insert(:movie_name => "test")
# puts "--------- x -------------"
# p x

y = s.insert(:title => 'aaa', :movie_id => x)
# puts "--------- y -------------"
# p y

z = s.insert(:title => 'bbb', :movie_id => x)
# puts "--------- z -------------"
# p z

# puts "--------- songs -------------"
# s.each do |song|
	# p song
	# e = m.filter(:id => song[:movie_id]).first
	
	# puts	"song = #{song[:title]}  movie = #{e[:movie_name]}}"
# end
	
m.each do |movi|
	f = s.filter(:movie_id => movi[:id])
	f.each do |sng|
		puts "movie = #{movi[:movie_name]}  song = #{sng[:title]}"
	end	
end	
	




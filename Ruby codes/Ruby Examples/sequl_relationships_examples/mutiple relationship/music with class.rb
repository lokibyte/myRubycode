%w(rubygems sequel yaml).each {|a| require a }

# DB = Sequel.sqlite ('G:\Ruby\MyWork\sequel\Database\mutiple relationship\Music.sqlite')
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
				:movies
		
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


class Movie < Sequel::Model(:movies)
	one_to_many		:songs,
					:key =>   :movie_id,
					:class => :Song
end

class Song < Sequel::Model(:songs)
	many_to_one		:movie,
					:key =>   :movie_id,
					:class => :Movie

	many_to_many	:singers,
					:left_key =>    :song_id,
					:right_key =>   :singer_id,
					:joint_table => :singers_songs,
					:class =>       :Singer

end

class Singer < Sequel::Model(:singers)
	many_to_many	:songs,
					:left_key => :singer_id,
					:right_key => :song_id,
					:joint_table => :singers_songs,
					:class => Song
end


movie1	= Movie.new(:movie_name => 'Sholay').save
movie2	= Movie.new(:movie_name => 'Dil se').save

song1	= Song.new(:title => 'AAAAA').save
song2	= Song.new(:title => 'BBBBBB').save
movie1.add_song(song1)
movie1.add_song(song2)

singer1	= Singer.new(:singer_name => 'Asha').save
singer2	= Singer.new(:singer_name => 'das').save
singer3	= Singer.new(:singer_name => 'rahman').save
# song1.add_singer(singer1)
singer1.add_song(song1)
singer2.add_song(song1)
singer3.add_song(song2)
singer1.save
singer2.save
singer3.save


# puts "==================================="

# p movie1.movie_name
# p song1.title

# p singer1.singer_name 



# Movie.each do |movie|
# puts "==================================="
	# puts "movie is #{movie.movie_name}"
	# movie.songs.each do |son|
# puts "-----------------------------------"
		# puts "song is #{son.title}"
		# son.singers.each do |sing|
			# puts "Singer = #{sing.singer_name} "
		# end
	# end
# end

Singer.each do |singe| 
	
	puts "singer = #{singe.singer_name}"
	singe.songs.each do |songsi|
		puts "song = #{songsi.title}"
		puts "movie #{songsi.movie.movie_name}"
		
	end
end


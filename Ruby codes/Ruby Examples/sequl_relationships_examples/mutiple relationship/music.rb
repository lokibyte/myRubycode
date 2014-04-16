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

# song1	= Song.new(:title => 'AAAAA', :movie_id => movie1.id).save
song1	= Song.new(:title => 'AAAAA').save
song2	= Song.new(:title => 'BBBBBB').save

# song1.movie = movie1
# song1.save
movie1.add_song(song1)
movie2.add_song(song2)


singer1	= Singer.new(:singer_name => 'Asha').save
# song1.add_singer(singer1)
singer1.add_song(song1)
singer1.save


puts "=============================="

p movie1.movie_name
p movie2.movie_name

p movie1.songs
# p movie1.songs[0]
p movie2.songs[0].title

puts "=============================="

# movie1.songs.each do |song|
	# puts song.title
# end
# p movie2.songs(:title)


# puts "=============================="
# p song1.title
# p song1.movie

# puts "=============================="

# p singer1.singer_name
# singer1.songs.each do |song|
# p song.title
# p song.movie.movie_name
# end

puts "=============================="


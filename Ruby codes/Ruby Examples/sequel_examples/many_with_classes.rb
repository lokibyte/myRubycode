require 'rubygems'
require 'sequel'


DB = Sequel::sqlite('association_classes.sqlite')

# Table 1-- :authors

DB.create_table? (:authors) do
	primary_key	:id		
	String		:name
	
end


# Table  2 -- :books

DB.create_table? (:books) do
	primary_key	:id		
	String		:title
	
end


#Table 3 --- :author_book


DB.create_table? (:author_book) do
	primary_key		:id
	foreign_key		:book_id, :books, :allow_null => false
	foreign_key		:author_id, :authors, :allow_null => false
	
	
end


# Classes 

	class Author < Sequel::Model(DB[:authors])
		many_to_many :books,
					 :left_key		=> :book_id,
					 :right_key		=> :author_id,
					 :join_table	=> :author_book
	end



	class Book < Sequel::Model(DB[:books])
		many_to_many :authors,
					 :left_key		=> :author_id,
					 :right_key		=> :book_id,
					 :join_table	=> :author_book
	end




	
	
	
# authr1=Authors.insert(:name=>'A')
# authr2=Authors.insert(:name=>'B ')
# authr3=Authors.insert(:name=>'C')



# book1=Books.insert(:title=>'c')
# book2=Books.insert(:title=>'c++')
# book3=Books.insert(:title=>'Ruby')
# book4=Books.insert(:title=>'Jruby')
# book5=Books.insert(:title=>'sinatra')

# cbook1=Auth_book.insert(:book_id=>book1,:author_id=>authr1)
# cbook2=Auth_book.insert(:book_id=>book1,:author_id=>authr2)
# cbook3=Auth_book.insert(:book_id=>book1,:author_id=>authr3)
# cppbook1=Auth_book.insert(:book_id=>book2,:author_id=>authr1)
# cppbook2=Auth_book.insert(:book_id=>book2,:author_id=>authr2)
# cppbook3=Auth_book.insert(:book_id=>book3,:author_id=>authr3)
# cppbook4=Auth_book.insert(:book_id=>book4,:author_id=>authr2)
# cppbook5=Auth_book.insert(:book_id=>book5,:author_id=>authr3)



# puts " c book authors are"
# cbook = Books.filter(:title=>'c').first
# get_join = Auth_book.filter(:book_id=>cbook[:id]).all
	# # p get_join
 # get_join.each do |r|
	# # p r
	# authors=Authors.filter(:id=>r[:author_id])
	
# authors.each do |authr|
		
		# p authr[:name]
		
		# end

# end


# puts "The Books written by C are: "

 # athr = Authors.filter(:name=>'C').first
 
# get_authr_join = Auth_book.filter(:author_id=> athr[:id]).first

 # get_authr_join.each do |r|
 
 # books = Books.filter(:id=>r[:book_id]).all
 # books.each do 
 # |n| p n[:title]
 # end
 
 
 # end









# Books.each do |p|
	
	# p p

 # end

# puts"\n\n\n"

# Authors.each do |bk|
	
	# p bk

# end

author_name = 'A'

author = Author.find(:name => author_name)
# p author

author.books.each do |bk|
	puts bk.title

	
	# puts "---- for #{bk.title} ----"
	# puts "-- authors are --"
	# bk.authors.each do |au|
		# puts au.name
		
		# puts "and they have written"
		# au.books.each do |bk2|
			# puts bk.title
			
# end			
# end
	puts "----------------"
end





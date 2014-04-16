require 'rubygems'
require 'sequel'


DB = Sequel::sqlite('association.sqlite')

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


DB.create_table? (:authors_books) do
	primary_key		:id
	foreign_key		:book_id, :books, :allow_null => false
	foreign_key		:auth_id, :authors, :allow_null => false
	
	
end




books	= DB[:books]
authors	= DB[:authors]
jointable	= DB[:authors_books]

# bookid = books.insert(:title => 'Lost Island')
# authorid = authors.insert(:name => 'Author A')

# joinid = jointable.insert(:book_id => bookid, :auth_id => authorid)




		# puts "who is the author of 'Lost Island'?"

		# book = books.filter(:title => 'Lost Island').first
		# bookid = book[:id]
		## p book[:id]

		# joint_row = jointable.filter(:book_id => bookid).first
		# authorid = joint_row[:auth_id]

		# author = authors.filter(:id => authorid).first
		####p author
		# puts "author of 'Lost Island' is '#{author[:name]}'"

puts "the books written by Author C are"

atr = authors.filter(:name =>'Author C')
p atr[:id]
# atrid=authors[:id] 
# joi= jointable.filter(:auth_id=> atrid).all
# bkid = joi[:book_id]
# bks=books.filter(:id=>bkid).all
# puts books[:title]
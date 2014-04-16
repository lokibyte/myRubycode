%w(rubygems sequel yaml).each {|a| require a }

# Database

DB = Sequel.sqlite ('G:\Ruby\MyWork\sequel\Database\dictmulmeaning.sqlite')

DB.create_table?:words do

	primary_key :id

	string 		:word,
				:unique => true,
				:null => false
end

DB.create_table?:meanings do

	primary_key 	:id

	string 			:meaning,
					:null => false

	foreign_key		:word_id,
					:words,
					:null => false,
					:on_delete => :cascade
						
					
end


class Word < Sequel::Model(:words)
	one_to_many	:meanings
end

class Meaning < Sequel::Model(:meanings)
	many_to_one :words
end



def show_instructions
	puts "Choose 'a' to add word"
	puts "Choose 'l' to list"
	puts "Choose 'q' to quit "
	puts "Choose 'd' to delete "
	puts "Choose 'e' to edit "
end


def get_option
	choice = gets.chomp
	while (choice !='a') and (choice !='l') and (choice !='q') and (choice !='d')and (choice !='e')
		puts "Invalid choice. Please choose a correct choice"
		show_instructions
		choice	= gets.chomp
	end
	return choice
end


show_instructions
option	= get_option

while option != 'q'
	case option
	when "a"
	
		begin
			puts " Enter the Word "
			word = gets.chomp
			w = Word.new(:word => word).save
			puts "Enter m for meaning "
			mul = gets.chomp
		
			while mul == 'm' 
				puts "Enter the meaning "
				mean = gets.chomp
				w.add_meaning(:meaning => mean)
				puts "Meaning Saved successfully"
				puts "Enter m for meaning or o for options "
				mul = gets.chomp
				
			end	
		rescue => e
			if (e.class == Sequel::DatabaseError)
				puts "----------------------"
				# puts "#{e.message} Enter another word "
				puts "Word already exist Enter another word "
				puts "======================"
			else
				puts "----------------------"
				puts "Unknown Error occurred = #{e.class} = #{e.message}"
				puts "======================"
			end
		end
		show_instructions
		option = get_option
				
	
	
	when "l"
		
		Word.each do |reco|
			puts "word is #{reco.word}"
			puts "meanings are"
			reco.meanings.each do |rec2|
			p rec2.meaning
			end
		end	
		show_instructions
		option = get_option
		
		
	when "d"
		
			puts " Enter the word to delete"
			del = gets.chomp
			dw = Word.filter(:word => del).first
			if dw
				# puts "word is #{dw.word}"
				
				# dw.meanings.each do |mng|
					# puts mng.values
					
					# puts "meanings are #{mng[:meaning]}"
					# mng.delete
				# end
				dw.delete
				puts " ##########Word deleted successfully###########"
				
			else 
				puts "word not found"	
			
			end
		
	show_instructions
	option = get_option
	
	when 'e'
		puts " Enter the word to edit"
			wedit = gets.chomp
			we = Word.filter(:word => wedit).first 
			if we 
				puts "Word is #{we.word}"
				we.meanings.each do |wed|
					puts "Meaning = #{wed[:meaning]}"
				puts " Enter the updated word"
				upw = gets.chomp
				
				we.update(:word =>upw)
				puts "word #{we.word} is updated"
				puts "Enter c to update the meaning "
				mu = gets.chomp
					while mu == 'c'
						puts " enter the meaning to update "
						me = gets.chomp
						# wed.filter(:meaning => me)
						puts "Enter the new updated meaning"
						um = gets.chomp
						wed.update(:meaning => um)
						puts "Meaning Updated"
					end
				end
					
			else 
			
			puts " word #{wedit} not found"
			
			
			end	
	show_instructions
	option = get_option			
			
	
	
	
	
		
	
	end
end

























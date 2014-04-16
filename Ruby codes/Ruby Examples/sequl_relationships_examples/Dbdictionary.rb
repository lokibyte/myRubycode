%w(rubygems sequel yaml).each {|a| require a }

# Database

DB = Sequel.sqlite ('G:\Ruby\MyWork\sequel\Database\dictionary.sqlite')

DB.create_table?:words do

	primary_key :id
	string 		:word,
				:unique => true,
				:null => false
	string		:meaning,
				:null => false

end


class Words < Sequel::Model(:words)
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
		puts " Enter the Word "
		word = gets.chomp
		puts "Enter the meaning "
		mean = gets.chomp
		begin
			j = Words.new(:word => word,:meaning => mean).save
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
			# puts " Word saved successfully"
		end

		show_instructions
		option = get_option
	when "l"
		list =[]

		Words.all.each do |words|
			list.push (words.values)
			puts "word = #{words.values[:word]} meaning = #{words.values[:meaning]}"

		end
		
		show_instructions
		option = get_option

	when "d"
		
		begin
		
		puts "Enter the word to delete"

		del = gets.chomp
		delsearch = Words.where(:word => del).first
		if delsearch
			puts "word is #{delsearch.word} and meaning is #{delsearch.meaning}"
			d = Words.where(:word => del).delete

			puts " ##########Word deleted successfully###########"
			rescue => e

				puts "\n\n\t #{e.message}\n\n"

				puts "Unknown Error occurred = #{e.class} message = #{e.message}"

		else 
			puts "word not found"	
		
		
		end

		show_instructions
		option = get_option

	when 'e'

		begin
			puts "Enter the word to edit"
			wedit = gets.chomp
			
			record = Words.filter(:word => wedit).first
			if record
				puts "word is #{record.word} and meaning is #{record.meaning}"
				puts "Enter the edited word"
				nedit = gets.chomp
				puts "Enter the Meaning of word "
				medit = gets.chomp

				m = Words.filter(:word => wedit).update(:word => nedit,:meaning => medit)

				puts "word edited"

			else
				puts "word not found"
			end
		rescue => e
				puts "\n\n\t #{e.message}\n\n"

				puts "Unknown Error occurred = #{e.class} message = #{e.message}"


		end

		show_instructions
		option = get_option
	end
end

























%w(rubygems sequel yaml).each {|a| require a }

# Database
DB = Sequel.sqlite # ('G:\Ruby\MyWork\sequel\Database\dictionary.sqlite')

DB.create_table? :words do
	primary_key :id
	String 		:word
end

DB.create_table? :meanings do
	primary_key :id
	String 		:meaning
	foreign_key	:word_id,
				:words,
				:null => false
end

class Word < Sequel::Model (:words)
	one_to_many	:meanings
end

class Meaning < Sequel::Model (:meanings)
	many_to_one	:word
end


w = Word.new(:word => 'a').save
# p w.id
# p w.word
# p w.methods.grep /mean/
w.add_meaning(:meaning => 'j')
w.add_meaning(:meaning => 'k')
w.add_meaning(:meaning => 'l')

# m = Meaning.new(:meaning => 'j', :word_id => w.id).save

# wordid = DB[:words].insert(:word => 'a')

# DB[:meanings].insert(:meaning => 'j', :word_id => wordid)

puts "------------------------"
Word.each do |reco|
	puts "word is #{reco.word}"
	puts "meanings are"
	reco.meanings.each do |rec2|
		p rec2.meaning
	end
end
# DB[:words].each do |wor|
	# p wor
# end
puts "========================"

puts "------------------------"
Meaning.each do |meaning_record|
	p meaning_record.meaning
	p meaning_record.word.values[:word]
end
# DB[:meanings].each do |mea|
	# p mea
# end
puts "========================"

# m = Meaning.filter(:meaning => 'k').first
# p m
# p w
# w.remove_all_meanings
# w.remove_meaning(m)
# puts "------------------------"
# DB[:meanings].each do |meb|
	# p meb
# end
# puts "========================"





























# word = 'a'

# w = DB[:words].filter(:word => word).first

# p w[:id]
# p w[:word]


# m = DB[:meanings].filter(:word_id => w[:id]).first
# p m[:id]
# p m[:meaning]


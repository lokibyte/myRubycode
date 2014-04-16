


# # words ={
		# # word => "a",
		# # mean1 => "aa",
		# # mean2 => "aaa"
	# # }



# words ={}
# word = 'a'
# mean = ["a","b","c"]
	

# words.update(word => mean) 

# puts words
# # {a => [a,b,c] , b => [b,d,f]} 
meaning = 2131231
hash = { 'word' => 'a'}
 10.times do |x|
	hash.update("meaning#{x}" => meaning += 1)
end

require 'yaml'
puts hash.to_yaml
# hash.each do |k, v|
	# puts "#{k} => #{v}"
# end

[
	[
		{'word'		=> 'a'},
		{'meaning1' => 'asdf1'},
		{'meaning2' => 'asdf2'},
		{'meaning3' => 'asdf3'},
		{'meaning4' => 'asdf4'}
	]
	[
		{'word'		=> 'b'},
		{'meaning1' => 'qwer1'},
	]
]


{
	'a' => [
				'asdf1',
				'asdf2',
				'asdf3'
			]
}	





[
	{'a' => 'asdf1'},
	{'a' => 'asdf2'},
	{'a' => 'asdf3'},
	{'a' => 'asdf4'}
]

require 'rubygems'

begin
	x = 1
	y = 1

	z = x / y
	puts z
	
	raise "Hello"
	
rescue => e
	if (e.class == ZeroDivisionError)
		puts "----------------------"
		puts e.class
		puts e.message
		puts "======================"
	else
		puts "----------------------"
		puts "Unknown Error occurred = #{e.class} = #{e.message}"
		puts "======================"
	end
end
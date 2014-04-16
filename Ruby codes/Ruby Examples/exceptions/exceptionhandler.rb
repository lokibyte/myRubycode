begin

# result = '2'/1
# result = 1/'2'
result = 1/0

puts 'hello' # 'hello' will not display

rescue Exception => e #generalized exception rescue clause
      puts( e.class ) 
      puts( e ) 

	  
# ensure

# puts 'hello' # here 'hello' will  display always wheather exception raise or not because it's in 'ensure' block

end

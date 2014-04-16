begin 
   # raise "Crazy Error"
 #---------exceptionerr1--  
   x = 1/0 
 # rescue Exception 
   # # x = 0 
   # # puts( $!.class ) 
   # # puts( $! )
   
rescue Exception => e
   # puts( e.class ) 
   # puts( e.message)
   puts("can't divide by zero")
puts"-------------"
   
# #-----exceptionerr2--
   # begin 
		# y= '1'/1
	# rescue Exception => f
		# puts (f.class)
		# puts (f.message)
# puts"-------------"
	# end
  
# #-----exceptionerr3--
	# begin
		# z = 1/'1'
	# rescue Exception => g
		# puts (g.class)
		# puts (g.message)
# puts"-------------"
	# end
   
end 
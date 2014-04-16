begin

# result = '2'/1  # TypeError exception
result = 1/'2'	#NoMethodError exception
rescue TypeError, NoMethodError => e  #specific exception rescue clause
      puts( e.class ) 
      puts( e ) 
      puts( "One of the values is not a number!" ) 
      result = nil 
rescue Exception => e 
      puts( e.class ) 
      puts( e ) 
      result = nil 


end
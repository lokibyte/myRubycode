startdir = Dir.getwd 
 
begin 
   Dir.chdir( "x:\\" ) 
   puts( `dir` ) 
rescue Exception => e 
   puts e.class 
   puts e 
ensure 
   Dir.chdir( startdir ) 
end 
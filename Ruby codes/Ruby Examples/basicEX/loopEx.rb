# h=Hash.new
# h.store(1,"loki")
# h.store(2,"ssss")
# h.store(3,"adsda")
# h.store(0,"zero")
# puts h
# puts h.keys.inspect
# puts h.values.inspect
# # a={1=>"okil"}
# # puts a

# =begin
# MR_COUNT = 0        # constant defined on main Object class
# module Foo
  # MR_COUNT = 0
  # ::MR_COUNT = 1    # set global count to 1
  # MR_COUNT = 2      # set local count to 2
# end
# puts MR_COUNT       # this is the global constant
# puts Foo::MR_COUNT
# =end
# x=1
# unless x>2
# puts "x is lessthan 2"
# else  
# puts "x is greater"
# end

#demo of case 


# marks=350
 # case marks
 # when 0...35
 # puts "fail"
 # when 35...70
 # puts "first class"
 # when 70...90
 # puts "distinction"
 # else
 # puts "congratulation"
 # end
 
 
 # #demo of while looop
 # a=0
 # n=5
 # while a<=n
 # puts ("#{a}-----");
 # a+=1
 # # n-=1
 # end
 
 
 # #demo of for loop
 # for i in 0...5
 # puts ("#{i}");
 # end
 
 
 # def loki
 # puts "loki method"
 # yield 10
 # puts " u r in again in loki def"
 # end
 # loki {|i|
 # puts "loki block#{i}"}
 
 a=[1,2,3,4,5,6]
 # p a.shift(10)
 # p1= a.pop(3)
  # p p1
  p a
  # tm=Time.new
  # p tm.inspect
  # puts tm.year
  # puts tm.month
  # puts tm.usec
  
  # a=gets
  # putc a
  
  h={1=>"one",2=>"two",3=>"three",4=>"four"}
  puts h
  #insertion
  h[5]="five"
 puts h
 #find the presence of keys in hashes
key=1
if h.has_key?(key)
puts "yes present:#{h[key]}"
else 
puts "not present"
end 


  
  
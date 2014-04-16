#demo of mixins

=begin
Mixins give you a wonderfully controlled way of 
adding functionality to classes. However, 
their true power comes out when the code in the mixin starts 
to interact with code in the class that uses it.


#
Module A consists of the methods a1 and a2. Module B consists
 of the methods b1 and b2. The class Sample includes 
 both modules A and B. The class Sample can access all four methods, 
 namely, a1, a2, b1, and b2. Therefore, you can see that the 
 class Sample inherits from both the modules. 
 Thus you can say the class Sample shows multiple inheritance or a mixin.
=end
module A
   def a1
   puts "in method a1 in module A"
   end
   def a2
   puts "in method a2 in module A"
   end
end
module B
   def b1
   puts "in method b1 in module B"
   end
   def b2
   puts "in method b2 in module B"
   end
end

class Sample
include A
include B
   def s1
   end
end

samp=Sample.new
puts samp.a1
puts samp.a2
puts samp.b1
puts samp.b2
puts samp.s1
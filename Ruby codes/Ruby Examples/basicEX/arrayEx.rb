# def example(num)
    # puts
    # puts "------ Example #{num} ------"
	# num+=0

# end
# puts example(0)
# digits = Array(0..9)

# num = digits.at(6)

# puts "#{num}"

# num2=digits.delete(6)
# puts num2


# n = [ 65, 66, 67 ]
# puts n
# n.clear
# n.delete([1])
a = [ "a", "b", "c" ]

# p a[0].to_i

# a.delete("a")
# a.delete_at(2)
 # puts a.methods.grep /delete/
# a.delete_if { |x| x >= 'b' }
# puts a


# square(6 + 3 * 9)
# puts methods.grep /math/
# def colors (arg1="blue", arg2="red")
# "#{arg1}, #{arg2}"
# end
# colors = 6
# print colors
# print self.colors
# i=0
# while i<=5
# a.each do |x| puts
# print x
# i+=1
# end
# end
# a.each { |i|
# puts
# print i
# }

# def var(arg,*rest)
# "we got #{arg} and #{rest.join(',')}"
# end
# puts var("one","two","three",'four')
# def five(a,b,c,d,e)
# "#{a},#{b},#{c},#{d},#{e},"
# end
# a=five(*(20..24).to_a)
# puts a
# a=[1,2,3]
# a[2]="loki"*3
# puts a


# a=[]
# a<<['a','b','c']
# puts a
# a<<2 #insert item @ last
# a.unshift("loki") #append items at front
# a.unshift(1)#append items at front
# a.insert(0,"digiprotech")
# a.insert(6,"six") #ins item @ index 6 as value "six"
# a.insert(10,"ten")
# a.insert(1,"Ruby")#insert RUby @location 1 in an array
# a.each {|i| puts puts i}
    # puts a.inspect
     # puts a.each.methods.grep /each/
	 # puts a.delete_at(0)
	 # puts a.inspect
 
#________ deletion items in array
			b=[1,2,3,4]
			 # b.each_with_index { |e,i|
			# b.delete_at(i) if i==1 #delete at known index 
			   # b.delete_at(0) #delete item @ first location
			  
			# }
			b.delete_if { |x| x==1}
			# }
			 # b.delete(4) # delete element 4 i.e item
			 # puts b.methods.grep /delete/
			 b.clear #remove all items
			p b

#---- sorting on array
c=[4,3,6,1,10,7]
p " array:#{c}"
p "sorted array:#{c.sort}"
c1=c.sort
#-----reverse the array
p "reverse array:#{c1.reverse}"

puts c1.length
c1.push(100)
c1.push(200)
p c1

				#sum of array elements
			# sum=0
			# c1.each { |i| sum+=i}
			# puts sum
puts c1.inject(:+)# adding arry elements in 1.9 efficiently


#-----Each methods demo------###########
p c1.length # display length of array
p c1.size # display size of array
p c.join # display all ietems as single element in array
puts a.inspect #'inspect gives the textual representation of object it's common for all builtin classes in ruby

# puts c1.methods.grep /each/
p c
c.each {|x| p x}		#traverse in forward direction
c.reverse_each { |x| p x} #traverse the items in reverse order

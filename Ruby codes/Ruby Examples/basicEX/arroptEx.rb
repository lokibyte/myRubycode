a=[1,2,3,4,45]
# p a.size
# p a.length
# p a
# p a.join
# a="hi welcome to ruby world"
# b="not found"
# puts "search successfull" unless a.index("hi") == nil
# puts a.split(/\s/).join(',')
# puts a.inspect #'inspect gives the textual representation of object it's common for all builtin classes in ruby

# demo of collect in array
 b=a.collect {|i| i*2}# collect iterates through an array element by element, and assigns to that element the
p b					 #result of any expression within the code block.
a1=[1,7,4,7,]
b1=[1,2,3,4,5]
c=a1+b1
p c
d=a1-b1 #it won't print -ve part of array here b1>a1 but b1 is -ve #removes unique items in array
p d

#-----------checking for an empty array
aa=[1,2,3]
if aa.empty?  #checking for empty
puts "array aa is empty"
else 
puts "array not empty it has some values"
end

#find out certain element in array
if aa.include? 25
puts "element found"
else
puts "not found"
end

p aa.first(3).join("-")

e=[0,1,2,3,4]
d1=e.clone
p "elements in cloning array: #{e}"
p "elements in cloned array: #{d1}"

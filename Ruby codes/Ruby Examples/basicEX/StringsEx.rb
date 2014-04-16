## ---------Examples done on 09/07/2012--------##

# puts "hello"
#{start/
# @num=8
# 6.times do
# puts "#{@num.class}: #@num"
# @num*=@num
# end
#}/end

# 50.step(80,5) { |i| print i," "}

#start
# 5.step(100,5) { 
# |x| 
# print x, 
# " "
# } #end


#---strings ex

# puts "that's right"

# puts "result:#{2*2*2}"
# puts "#{'hi       '*3}"

#-- strings ex

#--------ranges Example

# a=1..100
# puts a.include?5
# puts a.max
# puts a.min
# puts a.reject{ |i| i<5}

#ranges Example

#----input line ex

# while line= gets
# puts line if line =~/start/.. line =~/end/
# end


#---input line ex



##method returns Example 
# def meth(a)

# case
	# when a>0
	# "positive " 

	# when a<0
	# "negative"
		# else
		# "zero"
# end

# end
# a=Integer(gets)
# puts meth(a)

#-----end of  method returns ex

# --expanding array ex

# def five(a,b,c,d,e)
# "i am calling #{a} #{b} #{c} #{d} #{e} "
# end

# puts five( 1,2,3,4,5 )#if we put space b/w five and ( symbol it'll show syntax err

#---end expanding array ex

#---demo of yield

# def test
   # puts "You are in the method"
   # yield
   # puts "You are again back to the method"
   # yield
# end
# test {puts "You are in the block"}

def yldEx
puts "you r in method"
yield
end
yldEx { puts "you r in block"}



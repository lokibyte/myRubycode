require 'rubygems'

puts "name"

name = gets.chomp

puts "rate"

rate = gets.chomp

puts "qty"
a={}
qty = gets.chomp


a[:name]=name
a[:rate]=rate
a[:qty]=qty
b={}
b[:id]=1
b[:addrs]='bang'
puts " Hash A #{a}"
puts"Hash B   #{b}"
b.update(a)
puts"Hash B After updating  #{b}"
# a.update  


#----------Demo's of HAsHES-------#####
# h={"1"=>"loki","2"=>"jithu","3"=>"digiprotech"}
# puts h['1']
# h['1']="something"
# puts h['1']
# puts h
# h.each {|k,v| puts "#{k} equals #{v}"}

# puts h.keys #--- retrieving keys from hashes
 # h.delete('1')   #delete the items in hashes
 # p h
 # h1={'1'=>100,'2'=>20,'3'=>300}
 # h1.delete_if {|k1,v1| k1 <= '2'}   #delete the keys in hashes conditionally
 # puts h1
 #-------
 
 people = {
'fred' => {
'name' => 'Fred Elliott',
'age' => 63,
'gender' => 'male',
'favorite painters' => ['Monet', 'Constable', 'Da Vinci']
},
'janet' => {
'name' => 'Janet S Porter',
'age' => 55,
'gender' => 'female'
}
}
# puts people['fred']['age']
puts "favorite painters are:#{people['fred']['favorite painters']}"
# p people['janet']
 
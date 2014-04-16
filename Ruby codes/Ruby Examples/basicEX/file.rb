###---------file demo's

afile=File.new("loki.txt","w")
# if afile
# afile1=afile.sysread(30)
# puts afile1
# else 
# puts "unable to open the file"
# end
aa=File.delete("loki.txt")
if aa
puts "exists"
else
puts "not found"
end
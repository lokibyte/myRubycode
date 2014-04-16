class Foo
  def initialize()
    puts DATA.read.inspect
  end
end
puts DATA.read.inspect
Foo.new
__END__
test
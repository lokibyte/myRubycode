require './program'
require 'test/unit'

class TestSum < Test::Unit::TestCase
	
	def test_sum
		assert_equal 5, sum(2, 3)
	end
	
	def test_factorial
		assert_equal 6, factorial(3)
	end
	def test_factorial2
		assert_equal 24, factorial(4)
	end
	def test_factorial3
		assert_equal 120, factorial(5)
	end
	def test_factorial6
		assert_equal 720, factorial(6)
	end
	def test_factorial7
		assert_equal 1, factorial(1)
	end
	def test_factorial8
		assert_equal 1, factorial(0)
	end
	
end
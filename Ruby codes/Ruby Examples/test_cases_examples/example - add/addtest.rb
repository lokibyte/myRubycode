require 'test/unit'

require './addprogram'


class TestAdd < Test::Unit::TestCase
	def test_input_numeric_string
		result = add('1', 2)
		
		assert_equal 3, result
	end
	
	def test_input_alpha_string
		result = add('a', 2)
		
		assert_equal 'a2', result
	end
	
	
	def test_basic
		result = add(1,2)
		
		assert_equal 3, result
	end
end
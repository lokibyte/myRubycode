system("#{RUBY_PLATFORM.downcase.include?('linux') ? 'clear' : 'cls'}")

%w(rubygems rack/test sinatra test/unit).each { |lib| require lib }

require './sinatraprogram'


class TestAdd < Test::Unit::TestCase
	include Rack::Test::Methods
	
	def app
		Sinatra::Application
	end
	
	
	def test_home
		get '/'
		
		assert_equal 200, last_response.status
		assert_equal 'hello', last_response.body
	end

	def test_sum
		get '/sum/1/2'
		
		assert_equal 200, last_response.status
		assert_equal '3', last_response.body
	end
	
	
	# def test_add
		# request.body = {
			# 'num1' => 3,
			# 'num2' => 4
		# }
		
		# post '/add'
		
		# assert_equal 200, last_response.status
	# end
end

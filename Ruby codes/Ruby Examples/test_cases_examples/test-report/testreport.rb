system("#{RUBY_PLATFORM.downcase.include?('linux') ? 'clear' : 'cls'}")

%w(rubygems yaml rack/test sinatra test/unit).each { |lib| require lib }

require '../../../Testsinatra/WC/extjs4.1 trials/report/test.rb'
# ..\..\..\Testsinatra\WC\extjs4.1 trials\report\test.rb

# def invalid
	# raise "Exception"
# end


class TestReport < Test::Unit::TestCase
	include Rack::Test::Methods
	
	def app
		Sinatra::Application
		puts"-------------------"
		puts"-------------------"
	end
	
	def test_home
		get '/'

		assert_equal 200, last_response.status

	end
	
	def test_get_all_templates
		get '/templates'
		json_resp	= JSON.parse(last_response.body)

		assert_equal 200 ,last_response.status		# expecting for success status 
		assert_equal true ,json_resp['success']     #expecting success is true 
		assert_equal Array ,json_resp['value'].class #expecting responding values should be array
	end
	
	# def test_create_template
		# postvalues = {:title => 'newTemplate'}.to_json   
		# post '/templates', params=postvalues           # json i/p value

		# json_resp	= JSON.parse(last_response.body)  #getting response from server
		# record		= json_resp['value']
		
		# assert_equal 200 ,last_response.status
		# assert_equal true ,json_resp['success']
		# assert_not_nil record['id']                   #expecting 'id' for 'newTemplate' from database
	# end
	
	# def test_title
	
		# post '/templates' , params = {:title =>'new'}.to_json
		# json_resp = JSON.parse(last_response.body)
		
		# assert_equal 200 ,last_response.status
		# assert_equal true ,json_resp['success']
		# assert_equal 'new',json_resp['title']
	# end
	
	
	# def test_update_header
	
		# put '/templates/:id' , params = {:id =>3,:header => 'header data'}.to_json
		# json_resp = JSON.parse(last_response.body)
		
		# assert_equal 200 ,last_response.status
		# assert_equal true ,json_resp['success']
		# assert_equal 'header data',json_resp['header'],' "unsuccess header update" '
	
	# end
	
	# def test_update_footer
	
		# put '/templates/:id' , params = {:id =>3,:footer => 'footer data'}.to_json
		# json_resp = JSON.parse(last_response.body)
		
		# assert_equal 200 ,last_response.status
		# assert_equal true ,json_resp['success']
		# assert_equal 'footer data',json_resp['footer'],' "unsuccess footer update" '
	# end
	
	
	# def test_update_bottom
		# put '/templates/:id' , params = {:id =>3,:bottom => 'bottom data'}.to_json
		# json_resp = JSON.parse(last_response.body)
		
		# assert_equal 200 ,last_response.status
		# assert_equal true ,json_resp['success']
		# assert_equal 'bottom data',json_resp['bottom'],' "unsuccess bottom update" '
	# end
	
	
	def test_delete_existing_template
		post '/templates' , params = {:title =>'new'}.to_json
		json_resp	= JSON.parse(last_response.body)  #getting response from server
		record		= json_resp['value']

		delete "/templates/#{record['id']}"
		
		assert_equal 200, last_response.status
		assert_equal true ,json_resp['success']
	end
	
	# def test_invalid_url
		# delete "/randomurl"
		# # p '-----------------------------------------------------------------------------------'
		# # puts last_response.to_yaml
		# # p last_response.class
		# # p last_response.header
		# # p '-----------------------------------------------------------------------------------'
		
		# assert_equal 404, last_response.status
	# end
	
	# def test_invalid_request
		
		# get '/exceptionurl'
		
		# # p '-----------------------------------------------------------------------------------'
		# # puts last_response.to_yaml
		# # p last_response.class
		# # p last_response.status
		# # p last_response.body
		
		# # json_resp	= JSON.parse(last_response.body)  #getting response from server
		# # p json_resp
		# # p '-----------------------------------------------------------------------------------'
		
		# assert_equal 500, last_response.status
		# assert_equal "Exception", last_response.body
		
		# # # xcept = assert_raise(RuntimeError) { invalid() }
		
		# # # assert_equal RuntimeError, xcept.class
		# # # assert_match "Exception", xcept.message.to_s
	# end
	
end
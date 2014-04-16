%w(rubygems sinatra).each { |lib| require lib }

get '/' do
	'hello'
end


get '/sum/:num1/:num2' do
	(params[:num1].to_i + params[:num2].to_i).to_s
end

post '/add' do
	
	values = JSON.parse(request.body.read)
	
	num1 = values['num1'].to_i
	num2 = values['num2'].to_i
	
	result = num1 + num2
	
	resp = {
		'success' => true,
		'value'		=> result
	}
	
	resp.to_json
end
require 'rubygems'
require 'sinatra'
require 'slim'
require 'json'

set :public_folder, 'public'

get '/' do
slim :index

response = {
'success' => true,
'msg' => 'server msg'}
 return response.to_json
end

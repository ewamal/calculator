require 'bundler'; Bundler.require
require 'JSON'

get '/hello-world' do
  "Hello World"
end

get '/hello-world.json' do
  content_type :json

  {greeting: 'Hello World!'}.to_json

end

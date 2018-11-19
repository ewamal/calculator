require "bundler"
Bundler.require

require "json"

require "./models/user"
require "./models/calculation"
require "./lib/calculator"

register Sinatra::ActiveRecordExtension
set :database_file, 'config/database.yml'

def parse_curl_data
  body = request.body.read.to_s
  @req_data = JSON.parse(body) if body != ""
end

def parse_form_data
  parsed_array = JSON.parse(params["array"])
  @req_data = { "type" => params["type"], "array" => parsed_array }
rescue JSON::ParserError
  @req_data = { "type" => params["type"], "array" => "" }
end

get "/" do
  @type = params["type"]
  @result = params["result"]
  @error = params["error"]
  erb :home
end

post "/calculate" do
  content_type(:json)
  parse_form_data
  calculator = Calculator.new
  result = calculator.evaluate(@req_data)
  redirect "/?type=#{@req_data['type']}&result=#{result}"

rescue Calculator::MissingDataError, Calculator::MalformedDataError => error

  redirect "/?error=#{error.message}"

end

post "/evaluate" do
  content_type(:json)

  parse_curl_data
  calculator = Calculator.new
  { @req_data["type"] => calculator.evaluate(@req_data) }.to_json

rescue Calculator::MissingDataError, Calculator::MalformedDataError => error
  halt 400, { "error_message" => error.message }.to_json
end

# curl -H "Content-Type: application/json" -X POST --data
# '{ "type": "average", "array": [1, 2, 3] }' http://localhost:4567/evaluate

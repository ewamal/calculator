require "bundler"
Bundler.require
require "json"
require_relative "./lib/calculator"

def parse_data
  @req_data = if params
                parsed_array = JSON.parse(params["array"])
                { "type" => params["type"], "array" => parsed_array }
              else
                body = request.body.read.to_s
                JSON.parse(body) if body != ""
              end
end

get "/" do
  erb :home
end

post "/evaluate" do
  content_type(:json)

  parse_data
  calculator = Calculator.new
  { @req_data["type"] => calculator.evaluate(@req_data) }.to_json
rescue Calculator::MissingDataError, Calculator::MalformedDataError => error
  halt 400, { "error_message" => error.message }.to_json
end

# curl -H "Content-Type: application/json" -X POST --data
# '{ "type": "average", "array": [1, 2, 3] }' http://localhost:4567/evaluate

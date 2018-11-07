require "bundler"
Bundler.require
require "json"
require_relative "./lib/calculator"

before do
  body = request.body.read.to_s
  @req_data = JSON.parse(body) if body != ""
end

post "/evaluate" do
  content_type(:json)
  calculator = Calculator.new
  { @req_data['type'] => calculator.evaluate(@req_data) }.to_json
rescue Calculator::MissingKeyError, Calculator::MalformedDataError => error
  halt 400, { "error_message" => error.message }.to_json
end


# curl -H "Content-Type: application/json" -X POST --data '{ "type": "average", "array": [1, 2, 3] }' http://localhost:4567/evaluate

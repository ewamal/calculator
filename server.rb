require "bundler"
Bundler.require
require "JSON"
require_relative "./lib/calculator"

before do
  body = request.body.read.to_s
  @req_data = JSON.parse(body) if body != ""
end

post "/evaluate" do
  content_type(:json)
  calculator = Calculator.new
  { result: calculator.evaluate(@req_data) }.to_json
end

post "/average" do
  content_type(:json)
  calculator = Calculator.new(@req_data["array"])
  { average: calculator.average }.to_json
end

post "/median" do
  content_type(:json)

  calculator = Calculator.new(@req_data["array"])
  { median: calculator.median }.to_json
end

post "/mode" do
  content_type(:json)

  calculator = Calculator.new(@req_data["array"])
  { mode: calculator.mode }.to_json
end



# curl -H "Content-Type: application/json" -X POST --data "{ "array":[1, 2, 3]
# }" http://localhost:4567/average

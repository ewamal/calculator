require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

describe "calculator app" do
  # include Rack::Test::Methods
  #
  # def app
  #   Sinatra::Application
  # end

  it "responds with average" do
    post("/average", { "array" => [1, 2, 3] }.to_json)
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body)).to eq("average" => 2.0)
  end

  it "responds with mode" do
    post("/mode", { "array" => [1, 2, 3, 3] }.to_json)
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body)).to eq("mode" => 3)
  end

  it "responds with median" do
    post("/median", { "array" => [1, 2, 3] }.to_json)
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body)).to eq("median" => 2)
  end
end

require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

describe "calculator app" do
  it "responds with average" do
    post("/evaluate", { :type => 'average', :array => [1, 2, 3] }.to_json)
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body)).to eq("average" => 2.0)
  end

  it "returns 404 for unidentified path" do
    get("/hello-world")
    expect(last_response.status).to eq(404)
  end

  # it "responds with 400 for invalid data" do
  #   post("/average", { "foo" => [1, 2, 3] }.to_json)
  #   expect(last_response.status).to eq(400)
  #   expect(JSON.parse(last_response.body)).to eq("error_message" => "'array' key required")
  # end
end

require File.expand_path("../../spec_helper.rb", __FILE__)

describe User, type: :model do
  it { should have_many :calculations}

  subject { User.create(domain_name: "foo.com") }
  describe "full_names_for_email?" do


end


  it "returns average of the numbers" do
    subject = Calculator.new
    data = { "type" => "average", "array" => [1, 2, 3] }
    expect(subject.evaluate(data)).to eq(2)
  end

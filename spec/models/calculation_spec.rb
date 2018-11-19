require File.expand_path("../../spec_helper.rb", __FILE__)

describe Calculation, type: :model do
  it { should belong_to :user}
end

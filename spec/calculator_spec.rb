require_relative "../lib/calculator"

describe Calculator do
  describe ".initialize" do
    it "initialize with array of numbers" do
      subject = Calculator.new([1,2,3])
      expect(subject.numbers).to eq([1,2,3])
    end
  end

  describe "#average" do
    it "returns average of the numbers" do
      numbers = [1,2,3]
      subject = Calculator.new(numbers)
      expect(subject.average).to eq(2)

      numbers = [0,10]
      subject = Calculator.new(numbers)
      expect(subject.average).to eq(5)

      numbers = [0,23, 15.5]
      subject = Calculator.new(numbers)
      expect(subject.average).to eq(13)
    end
  end

  describe "#mode" do
    it 'returns the mode' do
      numbers = [2,3,4,5,5]
      subject = Calculator.new(numbers)
      expect(subject.mode).to eq(5)
    end
  end
end

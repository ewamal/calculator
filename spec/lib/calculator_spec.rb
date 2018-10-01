require_relative "../../lib/calculator"

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
    end

    it "returns average of the numbers" do
      numbers = [0,10]
      subject = Calculator.new(numbers)
      expect(subject.average).to eq(5)
    end

    it "returns average of the numbers" do
      numbers = [0,23, 15.5]
      subject = Calculator.new(numbers)
      expect(subject.average).to eq(12.83)
    end

    it "returns nil for an empty array" do
      numbers = []
      subject = Calculator.new(numbers)
      expect(subject.average).to eq(nil)
    end

    context "#average() with an argument" do
      it "returns average of some numbers" do
        subject = Calculator.new([1,2])
        arg = [2,4]
        expect(subject.average(arg)).to eq(3)
      end
    end

  end



  describe "#mode" do
    it 'returns the mode if there\'s a most frequent number ' do
      numbers = [2,3,4,5,5]
      subject = Calculator.new(numbers)
      expect(subject.mode).to eq(5)
    end

    it 'returns nil if there\'s one of each numbers ' do
      numbers = [2,3,4,5]
      subject = Calculator.new(numbers)
      expect(subject.mode).to eq(nil)
    end

    it 'returns nil mode if there\'s no most frequent number' do
      numbers = [2,4,4,5,5,3,3,3,1,1,1]
      subject = Calculator.new(numbers)
      expect(subject.mode).to eq(nil)
    end

    it 'returns the mode if there\'s one number in the array' do
      numbers = [2]
      subject = Calculator.new(numbers)
      expect(subject.mode).to eq(2)
    end


  end

  describe "#median" do
    it "returns the median of odd count" do
      numbers = [1,3,3,6,7,8,9]
      subject = Calculator.new(numbers)
      expect(subject.median).to eq(6)
    end

    it "returns the median of even count" do
      numbers = [1,2,3,4,5,6,8,9]
      subject = Calculator.new(numbers)
      expect(subject.median).to eq(4.5)
    end
  end

end

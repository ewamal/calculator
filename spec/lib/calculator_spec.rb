require_relative "../../lib/calculator"

describe Calculator do
  describe "#average" do

    it "returns sum of the numbers" do
      subject = Calculator.new
      data = { "type" => "add", "array" => [1, 2, 3] }
      expect(subject.evaluate(data)).to eq(6)
    end

    it "returns average of the numbers" do
      subject = Calculator.new
      data = { "type" => "average", "array" => [1, 2, 3] }
      expect(subject.evaluate(data)).to eq(2)
    end

    it "returns average of the numbers" do
      subject = Calculator.new
      data = { "type" => "average", "array" => [0, 10] }
      expect(subject.evaluate(data)).to eq(5)
    end

    it "returns average of the numbers" do
      subject = Calculator.new
      data = { "type" => "average", "array" => [0, 23, 15.5] }
      expect(subject.evaluate(data)).to eq(12.83)
    end
  end

  describe "#mode" do
    it "returns the mode if there's a most frequent number " do
      subject = Calculator.new
      data = { "type" => "mode", "array" => [2, 3, 4, 5, 5] }
      expect(subject.evaluate(data)).to eq(5)
    end

    it "returns nil if there's one of each numbers " do
      subject = Calculator.new
      data = { "type" => "mode", "array" => [2, 3, 4, 5] }
      expect(subject.evaluate(data)).to eq(nil)
    end

    it "returns nil mode if there's no most frequent number" do
      subject = Calculator.new
      data = { "type" => "mode", "array" => [2, 4, 4, 5, 5, 5, 1, 1, 1] }
      expect(subject.evaluate(data)).to eq(nil)
    end

    it "returns the mode if there's one number in the array" do
      subject = Calculator.new
      data = { "type" => "mode", "array" => [2] }
      expect(subject.evaluate(data)).to eq(2)
    end
  end

  describe "#median" do
    it "returns the median of odd count" do
      subject = Calculator.new
      data = { "type" => "median", "array" => [1, 3, 3, 6, 7, 8, 9] }
      expect(subject.evaluate(data)).to eq(6)
    end

    it "returns the median of even count" do
      subject = Calculator.new
      data = { "type" => "median", "array" => [1, 2, 3, 4, 5, 6, 8, 9] }
      expect(subject.evaluate(data)).to eq(4.5)
    end
  end

  describe "#evaluate" do
    it "evaluates average" do
      subject = Calculator.new
      data = { "type" => "average", "array" => [1, 2, 3] }
      expect(subject.evaluate(data)).to eq(2)
    end

    it "evaluates mode" do
      subject = Calculator.new
      data = { "type" => "mode", "array" => [1, 2, 3, 3] }
      expect(subject.evaluate(data)).to eq(3)
    end

    it "evaluates median" do
      subject = Calculator.new
      data = { "type" => "median", "array" => [1, 2, 3] }
      expect(subject.evaluate(data)).to eq(2)
    end

    context "error handling" do
      it "raises an error for missing keys" do
        subject = Calculator.new
        data = { "type" => "median" }
        expect { subject.evaluate(data) }
          .to raise_error(
            Calculator::MissingDataError, "array data missing"
          )
      end

      it "raises an error for missing keys" do
        subject = Calculator.new
        data = { "type" => "median", "array" => ["ewa", 1, 2] }
        expect { subject.evaluate(data) }
          .to raise_error(
            Calculator::MalformedDataError, "malformed data"
          )
      end

      it "raises an error for an empty array" do
        subject = Calculator.new
        data = { "type" => "average", "array" => [] }
        expect { subject.evaluate(data) }.to raise_error(
          Calculator::MissingDataError, "array data missing"
        )
      end

      it "raises an error for no type" do
        subject = Calculator.new
        data = { "type" => "", "array" => [3, 6, 4, 3] }
        expect { subject.evaluate(data) }.to raise_error(
          Calculator::MissingDataError, "type data missing"
        )
      end

      it "raises an error for unrecognized type " do
        subject = Calculator.new
        data = { "type" => "sfdfsd", "array" => [3, 6, 4, 3] }
        expect { subject.evaluate(data) }.to raise_error(
          Calculator::MalformedDataError, "malformed data"
        )
      end
    end
  end
end

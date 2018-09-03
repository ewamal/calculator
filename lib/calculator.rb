class Calculator
  def initialize(numbers)
    @numbers = numbers
  end

  def numbers
    @numbers
  end

  def average
    sum = 0
    numbers.each do |number|
      sum += number
    end
    (sum / numbers.count).round
  end

  def mode
    hash = {}
    numbers.each do |number|
      hash[number] += 1
    end
  end

end

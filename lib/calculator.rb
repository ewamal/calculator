require "pry"
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
      if !hash[number]
      hash[number] = 0
      end
      hash[number] += 1
    end

    result = nil

    hash.each do |key, value|
      if result == nil || value > hash[result]
        result = key
      end
    end
    if hash[result] == 1
      return nil
    end
    result
  end

  def median
    if numbers.count % 2 == 0
      numbers[numbers.count/2]
    end
    (numbers[(numbers.count/2).floor] + numbers[(numbers.count/2).ceil]) / 2
  end
  
end

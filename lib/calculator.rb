require "pry"
class Calculator
  def initialize(numbers)
    @numbers = numbers
  end

  def numbers
    @numbers
  end

  def average(arr = numbers)
    sum = 0
    arr.each do |number|
      sum += number
    end
    (sum / arr.count).round
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

    mode_count = hash[result]
    if hash.values.count(mode_count) > 1
      return nil
    end

    return result
  end

  def median
    if numbers.count % 2 != 0
      numbers[numbers.count/2]
    else
      (numbers[numbers.count/2] + numbers[numbers.count/2 - 1]) / 2.0
    end

  end

end

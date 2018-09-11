require "pry"
class Calculator
  def initialize(numbers)
    @numbers = numbers
  end

  def numbers
    @numbers
  end

  def average(arr = numbers)
    count = arr.count
    return nil if count == 0
    (arr.sum.to_f / count).round(2)
  end

  def mode

    hash = numbers.reduce({}) do |hash, num|
      hash[num] = 0 if !hash[num]
      hash[num] += 1
      hash
    end


    result = nil

    hash.each do |key, value|
      if result == nil || value > hash[result]
        result = key
      end
    end

    mode_count = hash[result]
    return nil if hash.values.count(mode_count) > 1

    return result
  end

  def median
    middle = numbers.count/2
    if numbers.count % 2 != 0
      numbers[middle]
    else
      average([numbers[middle],numbers[middle - 1]])
    end
  end
end

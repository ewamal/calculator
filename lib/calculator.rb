require "pry"

# class is calculating an array
class Calculator
  def initialize(numbers)
    @numbers = numbers
  end

  attr_reader :numbers

  def average(arr = numbers)
    count = arr.count
    return nil if count.zero?

    (arr.sum.to_f / count).round(2)
  end

  # TODO: refactor this method
  def mode
    hash = numbers.each_with_object({}) do |num, h|
      h[num] ? h[num] += 1 : h[num] = 1
    end

    result = nil
    hash.each do |key, value|
      result = key if result.nil? || value > hash[result]
    end

    mode_count = hash[result]
    return nil if hash.values.count(mode_count) > 1

    result
  end

  def median
    middle = numbers.count / 2
    if numbers.count.odd?
      numbers[middle]
    else
      average([numbers[middle], numbers[middle - 1]])
    end
  end
end

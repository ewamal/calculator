require "pry"

# class is calculating an array
class Calculator
  class MissingDataError < StandardError; end
  class MalformedDataError < StandardError; end

  def evaluate(data)
    type = data["type"]
    array = data["array"]

    raise MissingDataError.new("array data missing") if !array || array.empty?
    raise MissingDataError.new("type data missing") if !type || type.empty?
    raise MalformedDataError.new("malformed data") unless valid_numbers?(array)
    raise MalformedDataError.new("malformed data") unless valid_type?(type)

    case type
    when "average"
      average(array)
    when "mode"
      mode(array)
    when "median"
      median(array)
    end
  end

  def valid_type? (type)
    ["average","mode","median"].include? (type)
  end

  def valid_numbers? (numbers)
    numbers.all? do |number|
      number.is_a? Numeric
    end
  end

  def average(array)
    count = array.count
    return nil if count.zero?

    (array.sum.to_f / count).round(2)
  end

  # TODO: refactor this method
  def mode(array)
    hash = array.each_with_object({}) do |num, h|
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

  def median(array)
    middle = array.count / 2
    if array.count.odd?
      array[middle]
    else
      average([array[middle], array[middle - 1]])
    end
  end
end

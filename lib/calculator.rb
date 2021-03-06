require "pry"

# class is calculating an array
class Calculator
  class MissingDataError < StandardError; end
  class MalformedDataError < StandardError; end

# TODO: to long method
  def evaluate(data)
    type = data["type"]
    array = data["array"]

    raise MissingDataError, "no numbers passed" if array == ""
    raise MissingDataError, "type data missing" unless type
    raise MissingDataError, "array data missing" unless array
    raise MalformedDataError, "pass numbers in array" unless array_format?(array)
    raise MalformedDataError, "malformed data" unless valid_numbers?(array)
    raise MalformedDataError, "pass valid type" unless valid_type?(type)
    raise MissingDataError, "array data missing" if array.empty?
    raise MissingDataError, "type data missing" if type.empty?


    case type
    when "average"
      average(array)
    when "mode"
      mode(array)
    when "median"
      median(array)
    when "add"
      add(array)
    end

  end

  def valid_type?(type)
    %w[average mode median add].include? type
  end

  def array_format?(numbers)
    numbers.is_a? Array
  end

  def valid_numbers?(numbers)
    # return false unless numbers.is_a? Array

    numbers.all? do |number|
      number.is_a? Numeric
    end
  end

  def average(array)
    count = array.count
    return nil if count.zero?

    (array.sum.to_f / count).round(2)
  end

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

  def add(array)
    array.sum
  end

end

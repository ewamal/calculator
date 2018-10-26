require "pry"

# class is calculating an array
class Calculator

  def evaluate(data)
    type = data["type"]
    array = data["array"]

    case type
    when "average"
      average(array)
    when "mode"
      mode(array)
    when "median"
      median(array)
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

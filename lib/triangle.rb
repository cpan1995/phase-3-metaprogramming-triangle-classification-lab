require "pry"
class Triangle
  # write code here
  attr_accessor :uniq_counter

  def initialize(side1, side2, side3)
    @uniq_counter = [side1, side2, side3]
  end

  def kind

    temp_array = @uniq_counter.map(&:clone)
    largest_num = temp_array.max
    temp_num = temp_array.sum - temp_array.max

    @uniq_counter.each { |num|
      if num.negative?
        begin
          raise TriangleError
        end
      end
    }

    if @uniq_counter.include?(0)
      begin
        raise TriangleError
      end
    end
    if (temp_num <= largest_num)
      begin
        raise TriangleError
      end
    end

    if @uniq_counter.uniq.length == 1
      return :equilateral
    elsif @uniq_counter.uniq.length == 2
      return :isosceles
    elsif @uniq_counter.uniq.length == 3
      return :scalene
    end

  end

  class TriangleError < StandardError
    def message
      "This isn't a triangle dude"
    end
  end
end

# newTriangle = Triangle.new(1, 1, 3)
# pp newTriangle.kind
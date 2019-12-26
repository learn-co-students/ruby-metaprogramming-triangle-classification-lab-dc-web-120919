
class Triangle

  attr_accessor :kind
  attr_reader :side_a, :side_b, :side_c

  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
  end

  def kind
    triangle_validation
    if @side_a == @side_b && @side_b == @side_c
      return :equilateral
    elsif @side_a == @side_b || @side_b == @side_c || @side_a == @side_c
      return :isosceles
    else
      return :scalene
    end
  end

  def triangle_validation
      # The sum of the lengths of any two sides of a triangle always exceeds the length of the third side. This is a principle known as the triangle inequality.
  
    triangle_inequality_theorem = [(@side_a + @side_b > @side_c), (@side_b + @side_c > @side_a), (@side_c + @side_a > @side_b)]
    [side_a, side_b, side_c].each do |side|
        # Further, each side must be larger than 0.
      triangle_inequality_theorem << false if side <= 0
      raise TriangleError if triangle_inequality_theorem.include?(false)
    end
  end
  
  class TriangleError < StandardError
  end
end

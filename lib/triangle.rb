class Triangle

  attr_accessor :a, :b, :c 
  
  def initialize(a, b, c)
    
    @a, @b, @c = a, b, c

  end 

  def kind #returns the kind of triangle that was entered

    self.check_triangle

    if a==b && a==c && b==c 

      return :equilateral
    elsif a==b || b==c || a==c 

      return :isosceles
    else
      return :scalene
    end 

  end 

  def check_triangle #checks triangle and raises error 

    #makes a triangle array and checks each side of the triangle
    triangle = [(a+b>c), (a+c>b), (b+c>a)]
    [a,b,c].each do |side|
      triangle << false if side <= 0 
      raise TriangleError if triangle.include?(false)
    end 
  end 


  class TriangleError < StandardError
    #triangle error

  end 
end

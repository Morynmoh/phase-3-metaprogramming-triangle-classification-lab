class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    validate_triangle
  end

  def kind
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    validate_non_zero_sides
    validate_triangle_inequality
  end

  def validate_non_zero_sides
    if a <= 0 || b <= 0 || c <= 0
      raise TriangleError, "Sides of a triangle must be greater than 0"
    end
  end

  def validate_triangle_inequality
    if (a + b <= c) || (a + c <= b) || (b + c <= a)
      raise TriangleError, "Triangle inequality violated"
    end
  end

  class TriangleError < StandardError
  end
end


class Triangle
  attr_reader :side_a, :side_b, :side_c
  
  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
  end
  
  def kind
    sides = [@side_a, @side_b, @side_c]
    sorted_sides = sides.sort
    if sorted_sides[0] + sorted_sides[1] < sorted_sides[2] 
      begin 
        raise TriangleError
      rescue TriangleError => error
        puts error.inequality
      end
    elsif sides.any? {|side| side == 0}
      begin
        raise TriangleError
      rescue TriangleError => error
        puts error.no_side
      end
    elsif sides.any? {|side| side < 0}
      begin
        raise TriangleError
      rescue TriangleError => error
        puts error.negative_side
      end
    else
      if sides.uniq.length == 1
        :equilateral
      elsif sides.uniq.length == 2
        
      end
    end
    
  end
  
  class TriangleError < StandardError
    def inqeuality
      "The length of any two sides of a triangle must exceed the length of the third side"
    end
    
    def no_side
      "A triangle cannot have a side with no length"
    end
    
    def negative_side
      "A side of a triangle cannot be a negative number"
    end
    
  end
  
  
end

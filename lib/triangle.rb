class Triangle
  # write code here
  attr_reader :l1, :l2, :l3
  def initialize (l1, l2, l3)
    @l1 = l1
    @l2 = l2
    @l3 = l3
  end
  def kind
    sides = [@l1, @l2, @l3]
    unequal_sides= sides.uniq.length
    if @l1<=0 or @l2<=0 or @l3<=0
        raise TriangleError
      else
        if unequal_sides==1
          :equilateral
        elsif unequal_sides==2 
          self.triangle_inequality(:isosceles)
        else
          self.triangle_inequality(:scalene)
        end
      end
  end
  def triangle_inequality (state)
    sides = [@l1, @l2, @l3]
    possible_sum= sides.combination(2).to_a
    sum_greater_than_side= possible_sum.map.with_index do|s, i|
      s.sum>sides[-i-1]
    end
    val = sum_greater_than_side.select {|n| n==false}
    if val[0] ==false
      raise TriangleError
    else
      state
    end
  end

  class TriangleError < StandardError
    def message
      "This is not a valid triangle"
    end
  end
end
t1= Triangle.new(4, 3, 4)
puts t1.kind
# puts Triangle.count
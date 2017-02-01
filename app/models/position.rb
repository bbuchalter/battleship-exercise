class Position
  attr_reader :x, :y
  attr_accessor :hit, :shot_upon, :ship

  def initialize(x, y)
    @x = x
    @y = y
    @hit = false
    @shot_upon = false
    @ship = nil
  end
end

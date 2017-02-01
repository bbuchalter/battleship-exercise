class Ship
  LENGTH = 3
  VERTICAL = :vertical
  HORIZONTAL = :horizontal

  def initialize(x, y, length = LENGTH, orientation = VERTICAL)
    @x = x
    @y = y
    @length = length
    @orientation = orientation
  end

  def positions
    (0..(@length - 1)).map do |offset|
      if @orientation == VERTICAL
        [
          @x,
          (@y - offset)
        ]
      else
        [
          (@x + offset),
          @y
        ]
      end
    end
  end
end

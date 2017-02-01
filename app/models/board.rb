class Board
  def initialize
    @rows = 10
    @cols = 10
    @board = []
    @ships = []
    @rows.times do |x|
      @board.push []
      @cols.times do |y|
        @board[x].push Position.new(x, y)
      end
    end
  end

  def at(coord)
    raise InvalidCoordinate unless valid?(coord)
    @board[coord[0]][coord[1]]
  end

  def positions
    @board.flatten
  end

  def record_ship(ship)
    ship.coords.each do |coord|
      at(coord).ship = ship
    end
    @ships << ship
  end

  def valid?(coord)
    (coord[0] < @rows) &&
      (coord[0] >= 0) &&
      (coord[1] < @cols) &&
      (coord[1] >= 0)
  end

  private

  InvalidCoordinate = Class.new(StandardError)
end

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

  def positions
    @board.flatten
  end
end

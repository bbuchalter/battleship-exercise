class BattleshipsController < ApplicationController

  skip_before_action :verify_authenticity_token

  # Feel free to use a class variable, cache or other form of storage to solve this problem.
  # In our production code we avoid maintaining state in the controller. However for this
  # exercise it's ok to use a class variable. We're more interested in other aspects of your
  # solution. We promise not to judge you for using a class variable if you don't judge us too
  # harshly for having a problem that encourages it.

  def create
    coords = JSON.parse(params['positions'])

    @@board = Board.new
    coords.each do |coord|
      begin
        @@board.record_ship(Ship.new(coord[0], coord[1]))
      rescue Board::InvalidCoordinate
        render plain: "Unprocessable Entity", status: 422 and return
      end
    end

    render plain: "OK"
  end

  def update
    x = params['x'].to_i
    y = params['y'].to_i

    begin
      position = @@board.at([x,y])
    rescue Board::InvalidCoordinate
      render plain: "Unprocessable Entity", status: 422 and return
    end

    position.shot_upon = true

    ship = position.ship
    if ship
      position.hit = true

      if ship.positions(@@board).all?(&:hit)
        result = "sunk"
      else
        result = "hit"
      end
    else
      result = "miss"
    end

    render plain: result
  end
end

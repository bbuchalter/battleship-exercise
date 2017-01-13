class BattleshipsController < ApplicationController

  skip_before_action :verify_authenticity_token

  # Feel free to use a class variable, cache or other form of storage to solve this problem.
  # In our production code we avoid maintaining state in the controller. However for this
  # exercise it's ok to use a class variable. We're more interested in other aspects of your
  # solution. We promise not to judge you for using a class variable if you don't judge us too
  # harshly for having a problem that encourages it.

  def create
    positions = JSON.parse(params['positions'])

    # Fill in body to initialize the game and return a 200 response

    render plain: "OK"
  end

  def update
    x = params['x'].to_i
    y = params['y'].to_i

    # Fill in body to take x and y coordinates and return result as "miss", "hit" or "sunk"
    result = nil
    render plain: result
  end
end

class SimulationController < ApplicationController
  @@world = World.new(20, 20)  # ✅ Persist world
  @@ant = Ant.new(@@world, 10, 10)  # ✅ Persist ant

  def move
    @@ant.move  # ✅ Move the ant and update the grid
    render json: { grid: @@world.to_a }  # ✅ Send updated grid to frontend
  end
end
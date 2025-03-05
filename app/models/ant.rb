class Ant < ApplicationRecord
  attr_reader :world, :direction, :position

  def initialize(world=World.new, pos_x=5, pos_y=5)
    @world = world
    @position = Position.new(world, pos_x, pos_y)
    @direction = :south
  end

  def directions
    [:north, :east, :south, :west]
  end

  def run(steps = 100)
    steps.times do
      move
      puts world.to_s
      sleep 0.1
    end

    self
  end

  def move
    current_cell.toggle_color
    position.advance(direction)

    if current_cell.white?
      turn :right
    else
      turn :left
    end
  end

  def turn(turn_direction)
    current_index = directions.index(direction)

    if  turn_direction == :left
      @direction = directions[(current_index - 1) % directions.length]
    else
      @direction = directions[(current_index + 1) % directions.length]
    end
  end

  def current_cell
    world.gps(position)
  end
end
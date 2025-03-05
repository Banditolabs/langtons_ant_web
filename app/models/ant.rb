class Ant
  attr_reader :world, :direction, :position

  def initialize(world=World.new, pos_x=10, pos_y=10)
    @world = world
    @position = Position.new(world, pos_x, pos_y)
    @direction = :south
  end

  def directions
    [:north, :east, :south, :west]
  end

  def run(steps = 3)
    steps.times do
      move
      puts(world.to_s)
      sleep(0.01)
    end

    self
  end

  def move
    current_cell.toggle_color

    if current_cell.white?
      turn(:right)
    else
      turn(:left)
    end
    position.advance(direction)

  end

  def turn(turn_direction)
    current_index = directions.index(direction)

    if turn_direction == :left
      @direction = directions[(current_index - 1) % directions.length]
    else
      @direction = directions[(current_index + 1) % directions.length]
    end
  end

  def current_cell
    world.at(position)
  end
end
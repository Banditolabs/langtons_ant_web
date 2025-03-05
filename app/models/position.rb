class Position
  attr_accessor :x, :y

  def initialize(world, x, y)
    @world = world
    @x = x
    @y = y

    check_boundries
  end

  def check_boundries
    raise unless check_horizontal_bounds and check_vertical_bounds
  end

  def advance(direction)
    if direction == :north
      @y -= 1
    elsif direction == :east
      @x += 1
    elsif direction == :south
      @y += 1
    else
      @x -= 1
    end

    check_boundries
  end

  def to_s
    "(#{x}, #{y})"
  end

  private

  def check_horizontal_bounds
    0 <= @x && @x < @world.x
  end

  def check_vertical_bounds
    0 <= @y && @y < @world.y
  end
end
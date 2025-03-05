class Position
  attr_accessor :x, :y

  def initialize(world, x, y)
    raise "World cannot be nil" if world.nil?
    @world = world
    @x = x
    @y = y

    check_boundries
  end

  def check_boundries
    unless check_horizontal_bounds && check_vertical_bounds
      raise "Position out of bounds: (#{@x}, #{@y})"
    end
  end

  def advance(direction)
    case direction 
      when :north then @y -= 1
      when :east then @x += 1
      when :south then @y += 1
      when :west then @x -= 1
    end

    check_boundries
  end

  def to_s
    "(#{x}, #{y})"
  end

  private

  def check_horizontal_bounds
    (0...@world.width).include?(@x)
  end

  def check_vertical_bounds
    (0...@world.height).include?(@y)
  end
end
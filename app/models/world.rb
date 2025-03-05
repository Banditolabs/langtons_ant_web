class World
  attr_reader :grid, :width, :height

  def initialize(width = 10, height = 10)
    @width = width
    @height = height
    @grid = Array.new(height) { Array.new(width) { Cell.new } }
  end

  def at(position)
    @grid[position.y][position.x]
  end

  def flip(position)
    @grid[position.y][position.x] = @grid[position.y][position.x] == 0 ? 1 : 0
  end

  def to_a
    @grid.map { |row| row.map { |cell| cell.color } }
  end
end
class World
  attr_reader :cells, :x, :y

  def initialize(x = 10, y = 10)
    @x = x
    @y = y
    @cells = Array.new(y) {Array.new(x) {Cell.new}}
  end

  def gps(position)
    @cells[position.y][position.x]
  end

  def to_s
    @cells.collect do | row |
      row_string = row.collect do | cell |
        if cell.white?
          "."
        else
          "$"
        end
      end.join
      row_string += "/n"
    end.join
  end
end
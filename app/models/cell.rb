class Cell
  attr_reader :color

  def initialize
    @color = 0
  end

  def white?
    @color == 0
  end

  def toggle_color
    @color = @color == 0 ? 1 : 0
  end
end
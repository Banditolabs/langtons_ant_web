class Cell
  attr_reader :color

  def initialize
    @color = :white
  end

  def white?
    @color == :white
  end

  def toggle_color
    if white?
      @color = :black
    else
      @color = :white
    end
  end
end
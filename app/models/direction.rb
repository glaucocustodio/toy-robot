class Direction
  attr_reader :direction

  def initialize(direction)
    @direction = direction.to_s.downcase
  end

  def left?
    direction == "left"
  end

  def right?
    direction == "right"
  end
end

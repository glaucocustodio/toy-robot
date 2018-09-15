class Direction
  attr_reader :direction

  POSSIBILITIES = ['north', 'east', 'south', 'west']

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

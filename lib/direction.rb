class Direction
  attr_reader :direction

  POSSIBILITIES = ['north', 'east', 'south', 'west']

  def initialize(direction)
    @direction = direction.to_s.downcase
  end

  def new_face_given(current_face)
    index = if left?
      POSSIBILITIES.index(current_face) - 1
    else
      POSSIBILITIES.index(current_face) + 1
    end

    POSSIBILITIES.fetch(index, POSSIBILITIES.first)
  end

  def left?
    direction == "left"
  end

  def right?
    direction == "right"
  end
end

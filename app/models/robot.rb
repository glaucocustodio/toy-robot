class Robot < ApplicationRecord
  def unplaced?
    face == nil
  end

  def place_at(x, y, given_face)
    x ||= position_x
    y ||= position_y
    given_face ||= face
    update(position_x: x, position_y: y, face: given_face.downcase)
  end

  def placed_at?(x, y)
    (position_x == x && position_y == y)
  end

  def next_move
    if north?
      [:y, position_y - 1]
    elsif south?
      [:y, position_y + 1]
    elsif west?
      [:x, position_x - 1]
    else
      [:x, position_x + 1]
    end
  end

  def rotate_to(direction)
    new_direction = if direction.left?
      Direction::POSSIBILITIES.index(face) - 1
    else
      Direction::POSSIBILITIES.index(face) + 1
    end
    update(face: Direction::POSSIBILITIES.fetch(new_direction, Direction::POSSIBILITIES.first))
  end

  def north?
    face == 'north'
  end

  def south?
    face == 'south'
  end

  def west?
    face == 'west'
  end

  def east?
    face == 'east'
  end
end

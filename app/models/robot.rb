class Robot < ApplicationRecord
  def unplaced?
    position_x == nil || position_y == nil
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
    elsif east?
      [:x, position_x + 1]
    end
  end

  def rotate_to(direction)
    if north? && direction.left?
      west!
    elsif north? && direction.right?
      east!
    elsif south? && direction.left?
      east!
    elsif south? && direction.right?
      west!
    elsif west? && direction.left?
      south!
    elsif west? && direction.right?
      north!
    elsif east? && direction.left?
      north!
    elsif east? && direction.right?
      south!
    end
  end

  def north!
    update(face: 'north')
  end

  def south!
    update(face: 'south')
  end

  def west!
    update(face: 'west')
  end

  def east!
    update(face: 'east')
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

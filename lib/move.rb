class Move
  attr_reader :command, :x, :y, :face
  delegate :robot, to: :command

  def initialize(command)
    @command = command
  end

  def valid?
    if (@x, @y, @face = command.place?)
      Table.valid?(x, y)
    elsif command.move?
      axis, coordinate = robot.next_move
      instance_variable_set("@#{axis}", coordinate)
      Table.valid_for?(axis, coordinate)
    else
      true
    end
  end

  def act
    if (direction = command.direction?)
      robot.rotate_to(direction)
    else
      robot.place_at(x, y, face)
    end
  end
end

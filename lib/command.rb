class Command
  attr_reader :command, :cli, :robot, :x, :y, :face, :direction

  def initialize(command, robot, cli: false)
    @command, @robot, @cli = command, robot, cli
  end

  def execute
    return false unless proceed?
    move.act
  end

  def place?
    command.match(/^place (\d+),(\d+),(north$|south$|west$|east$)/i)&.captures
  end

  def move?
    command.match(/^move$/i)
  end

  def report?
    command.match(/^report$/i)
  end

  def direction?
    if direction = command.match(/^right$|^left$/i)
      Direction.new(direction)
    end
  end

  private

  def proceed?
    valid_command? && !first_command_invalid? && move.valid?
  end

  def move
    @move ||= Move.new(self)
  end

  def valid_command?
    place? || move? || direction? || (cli && report?)
  end

  def first_command_invalid?
    robot.unplaced? && !place?
  end
end

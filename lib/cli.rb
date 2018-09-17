interrupted = false
trap("INT") { interrupted = true } # traps Ctrl-C
puts 'Press Ctrl-C to exit'
@robot = Robot.new

def main
  puts 'Digite um comando:'
  command = gets.chop
  command = Command.new(command, @robot, cli: true)

  if result = command.execute
    puts result.is_a?(String) ? result : nil
  else
    puts 'comando inválido'
  end
end

until interrupted do
  main
end

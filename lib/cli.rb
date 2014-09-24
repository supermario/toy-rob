class CLI
  attr_reader :stdout, :stdin, :board, :toyrob, :terminated

  COMMANDS = {
    'PLACE' => :command_place,
    'MOVE' => :command_move,
    'RIGHT' => :command_right,
    'LEFT' => :command_left,
    'REPORT' => :command_report
  }

  def initialize(stdout = STDOUT, stdin = STDIN)
    @stdout = stdout
    @stdin = stdin
    @board = Board.new(5, 5)
    @toyrob = ToyRob.new
    @toyrob.place(@board)
    @terminated = false
  end

  def run
    while line = stdin.gets
      process(line)
    end
    rescue Interrupt
      # Catch ctrl+c exiting from shell
      @terminated = true
  end

  def process(raw_command)
    # Look for any commands that match the first word of the raw command
    command = COMMANDS.fetch(raw_command[/^\w+/], :command_ignore)
    # Call the command with the last chunk of unspaced text from the command
    send(command, raw_command.split.last)
  end

  def command_place(params)
    x, y, direction = params.split(',')
    return if direction.nil?
    toyrob.position(Pose.new(x.to_i, y.to_i, direction.downcase))
  end

  def command_move(_)
    toyrob.move
  end

  def command_right(_)
    toyrob.rotate_right
  end

  def command_left(_)
    toyrob.rotate_left
  end

  def command_report(_)
    stdout << toyrob
  end

  def command_ignore(_)
  end
end

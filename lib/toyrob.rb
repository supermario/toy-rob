class ToyRob
  attr_reader :pose, :board

  def initialize(pose = nil)
    @pose = pose || Pose.new
  end

  def move
    @pose = pose.next if valid?(pose.next)
  end

  def rotate_right
    @pose = pose.rotate_right
  end

  def rotate_left
    @pose = pose.rotate_left
  end

  def position(pose)
    @pose = pose if valid?(pose.next)
  end

  def place(board)
    @board = board
    @pose = Pose.new unless placed?
  end

  def placed?
    return false if board.nil?
    return false if pose.direction.nil?
    board.contains(pose)
  end

  def valid?(pose)
    board && board.contains(pose)
  end

  def to_s
    return 'unplaced' unless placed?
    "#{pose.x},#{pose.y},#{pose.direction.upcase}"
  end
end

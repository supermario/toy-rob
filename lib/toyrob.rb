class ToyRob
  attr_reader :pose, :board

  def initialize(pose = nil)
    @pose = pose || Pose.new
  end

  def move
    @pose = pose.next
  end

  def rotate_right
    @pose = pose.rotate_right
  end

  def rotate_left
    @pose = pose.rotate_left
  end

  def place(board)
    @board = board
  end

  def placed?
    return false if board.nil?
    return board.contains(pose.x, pose.y)
  end
end

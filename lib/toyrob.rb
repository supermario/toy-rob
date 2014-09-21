class ToyRob
  attr_reader :pose, :board

  def initialize(pose = nil)
    @pose = pose
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
  end

  def placed?
  end
end

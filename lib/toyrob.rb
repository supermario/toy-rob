class ToyRob
  attr_reader :pose

  def initialize(pose)
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
end

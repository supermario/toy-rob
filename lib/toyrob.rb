class ToyRob
  attr_reader :pose

  def initialize(pose)
    @pose = pose
  end

  def move
    @pose = pose.next
  end

  def turn_right
  end

  def turn_left
  end

  def pose
    @pose
  end
end

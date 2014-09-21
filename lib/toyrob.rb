class ToyRob
  attr_reader :pose

  def initialize(pose)
    @pose = pose
  end

  def move
    @pose = pose.next
  end

  def pose
    @pose
  end
end

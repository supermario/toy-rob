class Board < Struct.new(:width, :height)
  def contains(pose)
    (0...width).include?(pose.x) && (0...height).include?(pose.y)
  end
end

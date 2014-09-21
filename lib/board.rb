class Board < Struct.new(:width, :height)
  def contains(x, y)
    (0...width).include?(x) && (0...height).include?(y)
  end
end

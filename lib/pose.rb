class Pose < Struct.new(:x, :y, :direction)
  NORTH = 'north'
  SOUTH = 'south'
  EAST = 'east'
  WEST = 'west'

  def next
    case direction
    when NORTH
      Pose.new(x, y + 1, direction)
    end
  end
end

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

  def rotate_left
    case direction
    when NORTH
      Pose.new(x, y, WEST)
    when WEST
      Pose.new(x, y, SOUTH)
    when SOUTH
      Pose.new(x, y, EAST)
    when EAST
      Pose.new(x, y, NORTH)
    end
  end

  def rotate_right
    case direction
    when NORTH
      Pose.new(x, y, EAST)
    when EAST
      Pose.new(x, y, SOUTH)
    when SOUTH
      Pose.new(x, y, WEST)
    when WEST
      Pose.new(x, y, NORTH)
    end
  end
end

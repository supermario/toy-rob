class Pose < Struct.new(:x, :y, :direction)
  NORTH = 'north'
  SOUTH = 'south'
  EAST = 'east'
  WEST = 'west'
  DIRECTIONS = [NORTH, EAST, SOUTH, WEST]

  def next
    case direction
    when NORTH
      Pose.new(x, y + 1, direction)
    when WEST
      Pose.new(x - 1, y, direction)
    when SOUTH
      Pose.new(x, y - 1, direction)
    when EAST
      Pose.new(x + 1, y, direction)
    else
      Pose.new
    end
  end

  def rotate_left
    rotate(-1)
  end

  def rotate_right
    rotate(1)
  end

  private

  def dir_pos
    DIRECTIONS.index(direction)
  end

  def rotate(dir)
    return Pose.new if direction.nil?
    Pose.new(x, y, DIRECTIONS.rotate(dir_pos + dir).first)
  end
end

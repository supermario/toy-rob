step "a board of width :x and height :y" do |x, y|
  @board = Board.new(x,y)
end

step "a toy-rob at coords :x,:y facing :direction" do |x, y, direction|
  pose = Pose.new(x, y, direction)
  @toyrob = ToyRob.new(pose)
end

step "toy-rob moves" do
  @toyrob.move
end

step "he should be at :x,:y facing :direction" do |x, y, direction|
  pose = Pose.new(x, y, direction)
  expect(@toyrob.pose).to eq(pose)
end

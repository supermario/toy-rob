step "a board of width :x and height :y" do |x, y|
  @board = Board.new(x.to_i, y.to_i)
end

step "a toy-rob at coords :x,:y facing :direction" do |x, y, direction|
  pose = Pose.new(x.to_i, y.to_i, direction)
  @toyrob = ToyRob.new(pose)
end

step "toy-rob moves" do
  @toyrob.move
end

step "he should be at :x,:y facing :direction" do |x, y, direction|
  pose = Pose.new(x.to_i, y.to_i, direction)

  expect(@toyrob.pose).to eq(pose)
end

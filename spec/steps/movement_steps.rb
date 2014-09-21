step 'a board of width :x and height :y' do |x, y|
  @board = Board.new(x.to_i, y.to_i)
end

step 'a toy-rob at coords :x,:y facing :direction' do |x, y, direction|
  pose = Pose.new(x.to_i, y.to_i, direction)
  @toyrob = ToyRob.new(pose)
  @toyrob.place(@board)
end

step 'a toy-rob outside of the space-time continuum' do
  @toyrob = ToyRob.new
end

step 'toy-rob moves' do
  @toyrob.move
end

step 'toy-rob turns right' do
  @toyrob.rotate_right
end

step 'toy-rob turns left' do
  @toyrob.rotate_left
end

step 'he should be at :x,:y facing :direction' do |x, y, direction|
  pose = Pose.new(x.to_i, y.to_i, direction)

  expect(@toyrob.pose).to eq(pose)
end

step 'toy-rob should not be on the board' do
  expect(@toyrob.placed?).to be(false)
  expect(@toyrob.pose).to eq(Pose.new)
end

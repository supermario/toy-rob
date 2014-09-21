describe ToyRob do
  describe 'initialization' do
    it 'sets an initial pose' do
      pose = Pose.new(1, 2, Pose::NORTH)
      toyrob = ToyRob.new(pose)

      expect(toyrob.pose).to eq(pose)
    end
  end

  describe '#rotate_right' do
    it 'turns toy-rob to the right' do
      pose = double(:pose)
      toyrob = ToyRob.new(pose)

      expect(toyrob.pose).to receive(:rotate_right)

      toyrob.rotate_right
    end
  end

  describe '#rotate_left' do
    it 'turns toy-rob to the left' do
      pose = double(:pose)
      toyrob = ToyRob.new(pose)

      expect(toyrob.pose).to receive(:rotate_left)

      toyrob.rotate_left
    end
  end

  describe '#place' do
    it 'gives toy-rob a board' do
      board = Board.new(5, 5)
      toyrob = ToyRob.new(Pose.new(1, 1, Pose::NORTH))
      toyrob.place(board)

      expect(toyrob.board).to eq(board)
    end
  end

  describe '#placed?' do
    it 'is true when toy-rob\'s placement is within the board' do
      toyrob = ToyRob.new(Pose.new(1, 1, Pose::NORTH))
      board = Board.new(5, 5)
      toyrob.place(board)

      expect(toyrob.placed?).to be(true)
    end
    it 'is false when toy-rob\'s placement is outside the board' do
      toyrob = ToyRob.new(Pose.new(6, 6, Pose::NORTH))
      board = Board.new(5, 5)
      toyrob.place(board)

      expect(toyrob.placed?).to be(false)
    end
  end
end

describe ToyRob do
  describe 'initialization' do
    it 'sets an initial pose' do
      pose = Pose.new(1, 2, Pose::NORTH)
      toyrob = ToyRob.new(pose)

      expect(toyrob.pose).to eq(pose)
    end
  end

  describe '#turn_right' do
    it 'turns toy-rob to the right' do
      pose = Pose.new(0, 0, Pose::NORTH)
      toyrob = ToyRob.new(pose)
      toyrob.turn_right

      expect(toyrob.pose).to eq(Pose.new(0, 0, Pose::EAST))
    end
  end

  describe '#turn_left' do
    it 'turns toy-rob to the left' do
      pose = Pose.new(0, 0, Pose::NORTH)
      toyrob = ToyRob.new(pose)
      toyrob.turn_left

      expect(toyrob.pose).to eq(Pose.new(0, 0, Pose::WEST))
    end
  end
end

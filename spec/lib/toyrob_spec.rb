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
      pose = stub(:pose)
      toyrob = ToyRob.new(pose)

      expect(toyrob.pose).to receive(:rotate_right)

      toyrob.rotate_right
    end
  end

  describe '#rotate_left' do
    it 'turns toy-rob to the left' do
      pose = stub(:pose)
      toyrob = ToyRob.new(pose)

      expect(toyrob.pose).to receive(:rotate_left)

      toyrob.rotate_left
    end
  end
end

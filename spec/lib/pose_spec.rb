describe Pose do
  describe 'initialization' do
    subject(:pose) { Pose.new(1, 2, Pose::NORTH) }

    it 'sets an x coordinate' do
      expect(pose.x).to eq(1)
    end

    it 'sets a y coordinate' do
      expect(pose.y).to eq(2)
    end

    it 'sets a direction' do
      expect(pose.direction).to eq(Pose::NORTH)
    end
  end

  describe '#next' do
    context 'when facing north' do
      it 'increments the Y co-ordinate by 1' do
        pose = Pose.new(1, 2, Pose::NORTH)

        expect(pose.next).to eq(Pose.new(1, 3, Pose::NORTH))
      end
    end
  end

  describe '#rotate_right' do
    context 'when facing north' do
      it 'should turn east' do
        pose = Pose.new(0, 0, Pose::NORTH)

        expect(pose.rotate_right).to eq(Pose.new(0, 0, Pose::EAST))
      end
    end
    context 'when facing east' do
      it 'should turn south' do
        pose = Pose.new(0, 0, Pose::EAST)

        expect(pose.rotate_right).to eq(Pose.new(0, 0, Pose::SOUTH))
      end
    end
    context 'when facing south' do
      it 'should turn west' do
        pose = Pose.new(0, 0, Pose::SOUTH)

        expect(pose.rotate_right).to eq(Pose.new(0, 0, Pose::WEST))
      end
    end
    context 'when facing west' do
      it 'should turn north' do
        pose = Pose.new(0, 0, Pose::WEST)

        expect(pose.rotate_right).to eq(Pose.new(0, 0, Pose::NORTH))
      end
    end
  end

  describe '#rotate_left' do
    context 'when facing north' do
      it 'should turn west' do
        pose = Pose.new(0, 0, Pose::NORTH)

        expect(pose.rotate_left).to eq(Pose.new(0, 0, Pose::WEST))
      end
    end
    context 'when facing west' do
      it 'should turn south' do
        pose = Pose.new(0, 0, Pose::WEST)

        expect(pose.rotate_left).to eq(Pose.new(0, 0, Pose::SOUTH))
      end
    end
    context 'when facing south' do
      it 'should turn east' do
        pose = Pose.new(0, 0, Pose::SOUTH)

        expect(pose.rotate_left).to eq(Pose.new(0, 0, Pose::EAST))
      end
    end
    context 'when facing east' do
      it 'should turn north' do
        pose = Pose.new(0, 0, Pose::EAST)

        expect(pose.rotate_left).to eq(Pose.new(0, 0, Pose::NORTH))
      end
    end
  end

end

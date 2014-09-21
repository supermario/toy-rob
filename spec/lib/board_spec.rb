describe Board do
  describe 'initialization' do
    subject(:board) { Board.new(1, 2) }

    it 'sets a width' do
      expect(board.width).to eq(1)
    end

    it 'sets a height' do
      expect(board.height).to eq(2)
    end
  end

  describe '#contains' do
    subject(:board) { Board.new(5, 5) }

    it 'contains internal co-ordinates' do
      expect(board.contains(Pose.new(1, 2))).to be(true)
      expect(board.contains(Pose.new(2, 3))).to be(true)
      expect(board.contains(Pose.new(3, 4))).to be(true)
    end

    it 'contains boundary co-ordinates' do
      expect(board.contains(Pose.new(0, 0))).to be(true)
      expect(board.contains(Pose.new(4, 4))).to be(true)
    end

    it 'does not contain external coordinates' do
      expect(board.contains(Pose.new(-1, 0))).to be(false)
      expect(board.contains(Pose.new(5, 5))).to be(false)
    end
  end
end

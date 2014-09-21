describe Board do
  describe "initialization" do
    subject(:board) { Board.new(1, 2) }

    it "sets a width" do
      expect(board.width).to eq(1)
    end

    it "sets a height" do
      expect(board.height).to eq(2)
    end
  end
end

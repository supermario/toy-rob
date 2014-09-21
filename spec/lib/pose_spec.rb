describe Pose do
  describe "initialization" do
    subject(:pose) { Pose.new(1, 2, Pose::NORTH) }

    it "sets an x coordinate" do
      expect(pose.x).to eq(1)
    end

    it "sets a y coordinate" do
      expect(pose.y).to eq(2)
    end

    it "sets a direction" do
      expect(pose.direction).to eq(Pose::NORTH)
    end
  end
end

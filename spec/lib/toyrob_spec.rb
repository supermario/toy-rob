describe ToyRob do
  describe "initialization" do
    it "sets an initial pose" do
      pose = Pose.new(1, 2, Pose::NORTH)
      toyrob = ToyRob.new(pose)

      expect(toyrob.pose).to eq(pose)
    end
  end
end

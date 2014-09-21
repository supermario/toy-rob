describe CLI do
  before(:each) do
    @stdout = StringIO.new
    @stdin = StdinFaker.new
  end
  describe '#run' do

    it 'takes input from stdin' do
      @stdin << 'HELLO'
      @stdin << 'WORLD'
      cli = CLI.new(@stdout, @stdin)

      expect { cli.run }.to change { @stdin.inputs }.to([])
    end
    it 'writes output to stdout' do
      @stdin << 'REPORT'
      cli = CLI.new(@stdout, @stdin)
      cli.run

      expect(@stdout.string).not_to be_empty
    end

    it 'should handle an interrupt' do
      @stdin = StdinCrasher.new
      @stdin << 'TESTING'
      cli = CLI.new(@stdout, @stdin)

      expect { cli.run }.to change { cli.terminated }.to(true)
    end
  end
  describe '#process' do
    it 'triggers a matching command' do
      @stdin << 'REPORT'
      cli = CLI.new(@stdout, @stdin)
      expect(cli).to receive(:command_report)

      cli.run
    end

    it 'triggers ignore for invalid commands' do
      @stdin << 'INVALIDCOMMAND'
      cli = CLI.new(@stdout, @stdin)
      expect(cli).to receive(:command_ignore)

      cli.run
    end
  end

  describe '#command_place' do
    it 'should pose toyrob' do
      @stdin << 'PLACE 0,0,NORTH'
      cli = CLI.new(@stdout, @stdin)
      expect(cli.toyrob).to receive(:position)

      cli.run
    end
    it 'should position toyrob correctly' do
      @stdin << 'PLACE 0,0,NORTH'
      cli = CLI.new(@stdout, @stdin)
      cli.run

      expect(cli.toyrob.pose).to eq(Pose.new(0, 0, Pose::NORTH))
    end
  end

  describe '#command_move' do
    it 'should move toyrob' do
      @stdin << 'MOVE'
      cli = CLI.new(@stdout, @stdin)
      expect(cli.toyrob).to receive(:move)

      cli.run
    end
  end

  describe '#command_right' do
    it 'should turn toyrob right' do
      @stdin << 'RIGHT'
      cli = CLI.new(@stdout, @stdin)
      expect(cli.toyrob).to receive(:rotate_right)

      cli.run
    end
  end

  describe '#command_left' do
    it 'should turn toyrob left' do
      @stdin << 'LEFT'
      cli = CLI.new(@stdout, @stdin)
      expect(cli.toyrob).to receive(:rotate_left)

      cli.run
    end
  end

  describe '#command_report' do
    it 'should print toyrob' do
      @stdin << 'REPORT'
      cli = CLI.new(@stdout, @stdin)
      expect(cli.toyrob).to receive(:to_s)

      cli.run
    end

    it 'should print the correct location' do
      @stdin << 'PLACE 1,2,EAST'
      @stdin << 'REPORT'
      cli = CLI.new(@stdout, @stdin)
      cli.run

      expect(@stdout.string).to eq('1,2,EAST')
    end
  end
end

class StdinFaker
  attr_reader :inputs

  def initialize
    @inputs = []
  end

  def <<(input)
    @inputs << input
  end

  def gets
    @inputs.shift
  end
end

class StdinCrasher < StdinFaker
  def gets
    fail Interrupt
  end
end

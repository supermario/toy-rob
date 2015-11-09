describe CLI do
  let(:stdout)  { StringIO.new }
  let(:stdin)   { StdinFaker.new }
  subject(:cli) { CLI.new(stdout, stdin) }

  describe '#run' do
    let(:input) { %w(HELLO WORLD) }

    it 'takes input from stdin' do
      stdin << 'HELLO'
      stdin << 'WORLD'

      expect { subject.run }.to change { stdin.inputs }.to([])
    end
    it 'writes output to stdout' do
      stdin << 'REPORT'
      subject.run

      expect(stdout.string).not_to be_empty
    end

    context 'with crashing stdin' do
      let(:stdin) { StdinCrasher.new }

      it 'should handle an interrupt' do
        expect { subject.run }.to change { subject.terminated }.to(true)
      end
    end
  end

  describe '#process' do
    it 'triggers a matching command' do
      stdin << 'REPORT'

      expect(subject).to receive(:command_report)

      subject.run
    end

    it 'triggers ignore for invalid commands' do
      stdin << 'INVALIDCOMMAND'

      expect(subject).to receive(:command_ignore)

      subject.run
    end
  end

  describe '#command_place' do
    it 'should pose toyrob' do
      stdin << 'PLACE 0,0,NORTH'

      expect(subject.toyrob).to receive(:position)

      subject.run
    end
    it 'should position toyrob correctly' do
      stdin << 'PLACE 0,0,NORTH'

      subject.run

      expect(subject.toyrob.pose).to eq(Pose.new(0, 0, Pose::NORTH))
    end
    it 'should ignore invalid inputs' do
      stdin << 'PLACE'
      stdin << 'PLACE test'
      stdin << 'PLACE ,,,'

      subject.run
    end
  end

  describe '#command_move' do
    it 'should move toyrob' do
      stdin << 'MOVE'

      expect(subject.toyrob).to receive(:move)

      subject.run
    end
  end

  describe '#command_right' do
    it 'should turn toyrob right' do
      stdin << 'RIGHT'

      expect(subject.toyrob).to receive(:rotate_right)

      subject.run
    end
  end

  describe '#command_left' do
    it 'should turn toyrob left' do
      stdin << 'LEFT'

      expect(subject.toyrob).to receive(:rotate_left)

      subject.run
    end
  end

  describe '#command_report' do
    it 'should print toyrob' do
      stdin << 'REPORT'

      expect(subject.toyrob).to receive(:to_s)

      subject.run
    end

    it 'should print the correct location' do
      stdin << 'PLACE 1,2,EAST'
      stdin << 'REPORT'

      subject.run

      expect(stdout.string).to eq('1,2,EAST')
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

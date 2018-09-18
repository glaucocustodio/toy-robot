RSpec.describe Move do
  subject { described_class.new(command) }

  describe '#valid?' do
    context 'command is place' do
      let(:command) { double(:command, place?: ['1', '2', 'north']) }

      it do
        expect(Table).to receive(:valid?).with('1', '2').and_return(:any)
        expect(subject.valid?).to eq(:any)
      end
    end

    context 'command is move' do
      let(:command) { double(:command, place?: false, move?: true, robot: robot) }
      let(:robot) { double(:robot) }
      let(:axis) { 'x' }
      let(:coordinate) { double(:coordinate) }

      it do
        expect(robot).to receive(:next_move).and_return([axis, coordinate])
        expect(Table).to receive(:valid_for?).with(axis, coordinate).and_return(:any)
        expect(subject.valid?).to eq(:any)
      end
    end

    context 'any other' do
      let(:command) { double(:command, place?: false, move?: false) }

      it do
        expect(subject.valid?).to eq(true)
      end
    end
  end

  describe '#act' do
    context 'command is report' do
      let(:command) { double(:command, report?: true, robot: robot) }
      let(:robot) { double(:robot, report: :result) }

      it do
        expect(subject.act).to eq(:result)
      end
    end

    context 'command is direction' do
      let(:command) { double(:command, report?: false, direction?: :direction, robot: robot) }
      let(:robot) { double(:robot) }

      it do
        expect(robot).to receive(:rotate_to).with(:direction).and_return(:result)
        expect(subject.act).to eq(:result)
      end
    end

    context 'command is other' do
      let(:command) { double(:command, report?: false, direction?: false, robot: robot) }
      let(:robot) { double(:robot) }

      it do
        expect(subject).to receive_messages(x: :x, y: :y, face: :face)
        expect(robot).to receive(:place_at).with(:x, :y, :face).and_return(:any)
        expect(subject.act).to eq(:any)
      end
    end
  end
end

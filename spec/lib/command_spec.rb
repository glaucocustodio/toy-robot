RSpec.describe Command do
  subject { described_class.new(command, robot) }
  let(:command) { double(:command) }
  let(:robot) { double(:robot) }

  describe '#execute' do
    context 'not proceeding' do
      it do
        expect(subject).to receive_messages(place?: false, move?: false, direction?: false)
        expect(subject.execute).to eq(false)
      end
    end

    context 'proceeding' do
      let(:move) { double(:move, valid?: true) }
      let(:robot) { double(:robot, unplaced?: false) }

      it do
        expect(subject).to receive(:place?).and_return(true)
        expect(Move).to receive(:new).once.with(subject).and_return(move)
        expect(move).to receive(:act).and_return(:result)
        expect(subject.execute).to eq(:result)
      end
    end
  end

  describe '#place?' do
    let(:command) { "place 1,2,south" }

    it do
      expect(subject.place?).to eq(["1", "2", "south"])
    end
  end

  describe '#move?' do
    let(:command) { "move" }

    it do
      expect(subject.move?).not_to eq(nil)
    end
  end

  describe '#report?' do
    let(:command) { "report" }

    it do
      expect(subject.report?).not_to eq(nil)
    end
  end

  describe '#direction?' do
    after do
      expect(Direction).to receive(:new).and_return(direction)
      expect(subject.direction?).to eq(direction)
    end

    context 'left' do
      let(:command) { "LEFT" }
      let(:direction) { double(:direction) }
    end

    context 'right' do
      let(:command) { "right" }
      let(:direction) { double(:direction) }
    end
  end
end

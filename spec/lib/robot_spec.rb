RSpec.describe Robot do
  describe '#unplaced?' do
    context 'true' do
      it do
        allow(subject).to receive(:face).and_return(nil)
        expect(subject.unplaced?).to eq(true)
      end
    end

    context 'false' do
      it do
        allow(subject).to receive(:face).and_return('north')
        expect(subject.unplaced?).to eq(false)
      end
    end
  end

  describe '#place_at' do
    context 'coordinates given' do
      it do
        expect(subject).to receive(:update).with(position_x: 1, position_y: 2, face: 'n')

        subject.place_at(1, 2, 'N')
      end
    end

    context 'nil given' do
      it do
        expect(subject).to receive_messages(position_x: 'x', position_y: 'y', face: 'f')
        expect(subject).to receive(:update).with(position_x: 'x', position_y: 'y', face: 'f')

        subject.place_at(nil, nil, nil)
      end
    end
  end

  describe '#placed_at?' do
    context 'false' do
      it do
        allow(subject).to receive(:position_x).and_return(2)
        allow(subject).to receive(:position_y).and_return(3)

        expect(subject.placed_at?(1,1)).to eq(false)
      end
    end

    context 'true' do
      it do
        allow(subject).to receive(:position_x).and_return(4)
        allow(subject).to receive(:position_y).and_return(5)

        expect(subject.placed_at?(4,5)).to eq(true)
      end
    end
  end

  describe '#next_move' do
    context 'face is north' do
      it do
        expect(subject).to receive_messages(north?: true, position_y: 2)
        expect(subject.next_move).to eq([:y, 1])
      end
    end

    context 'face is south' do
      it do
        expect(subject).to receive_messages(north?: false, south?: true, position_y: 3)
        expect(subject.next_move).to eq([:y, 4])
      end
    end

    context 'face is west' do
      it do
        expect(subject).to receive_messages(north?: false, south?: false, west?: true, position_x: 4)
        expect(subject.next_move).to eq([:x, 3])
      end
    end

    context 'face is east' do
      it do
        expect(subject).to receive_messages(north?: false, south?: false, west?: false, position_x: 5)
        expect(subject.next_move).to eq([:x, 6])
      end
    end
  end

  describe '#rotate_to' do
    let(:direction) { double(:direction) }

    it do
      expect(direction).to receive(:new_face_given).and_return('whatever')
      expect(subject).to receive(:update).with(face: 'whatever')

      subject.rotate_to(direction)
    end
  end

  describe '#north?' do
    it do
      expect(subject).to receive(:face).and_return('north')
      expect(subject.north?).to eq(true)
    end
  end

  describe '#south?' do
    it do
      expect(subject).to receive(:face).and_return('south')
      expect(subject.south?).to eq(true)
    end
  end

  describe '#west?' do
    it do
      expect(subject).to receive(:face).and_return('west')
      expect(subject.west?).to eq(true)
    end
  end

  describe '#east?' do
    it do
      expect(subject).to receive(:face).and_return('east')
      expect(subject.east?).to eq(true)
    end
  end
end

RSpec.describe Robot, model: true do
  describe '#unplaced?' do
    context 'position_x not set' do
      it do
        allow(subject).to receive(:position_x).and_return(nil)
        allow(subject).to receive(:position_y).and_return('any')

        expect(subject.unplaced?).to eq(true)
      end
    end

    context 'position_y not set' do
      it do
        allow(subject).to receive(:position_x).and_return('any')
        allow(subject).to receive(:position_y).and_return(nil)

        expect(subject.unplaced?).to eq(true)
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
    it do
    end
  end

  describe '#rotate_to' do
    it do
    end
  end

  describe '#north!' do
    it do
    end
  end

  describe '#south!' do
    it do
    end
  end

  describe '#west!' do
    it do
    end
  end

  describe '#east!' do
    it do
    end
  end

  describe '#north?' do
    it do
    end
  end

  describe '#south?' do
    it do
    end
  end

  describe '#west?' do
    it do
    end
  end

  describe '#east?' do
    it do
    end
  end
end

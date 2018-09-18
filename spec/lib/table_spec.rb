RSpec.describe Table do
  describe '.x_min' do
    it do
      expect(described_class.x_min).to eq(0)
    end
  end

  describe '.x_max' do
    it do
      expect(described_class.x_max).to eq(4)
    end
  end

  describe '.y_min' do
    it do
      expect(described_class.y_min).to eq(0)
    end
  end

  describe '.y_max' do
    it do
      expect(described_class.y_max).to eq(4)
    end
  end

  describe '.valid?' do
    let(:x) { double(:x) }
    let(:y) { double(:y) }

    it do
      expect(described_class).to receive(:valid_x?).with(x).and_return(true)
      expect(described_class).to receive(:valid_y?).with(y).and_return(true)
      expect(described_class.valid?(x, y)).to eq(true)
    end
  end

  describe '.valid_for?' do
    let(:coordinate) { double(:coordinate) }

    context 'axis x' do
      it do
        expect(described_class).to receive(:valid_x?).with(coordinate)
        described_class.valid_for?(:x, coordinate)
      end
    end

    context 'axis y' do
      it do
        expect(described_class).to receive(:valid_y?).with(coordinate)
        described_class.valid_for?(:y, coordinate)
      end
    end
  end

  describe '.valid_x?' do
    it do
      expect(described_class).to receive(:x_min).and_return(0)
      expect(described_class).to receive(:x_max).and_return(4)
      expect(described_class.valid_x?(1)).to eq(true)
    end
  end

  describe '.valid_y?' do
    it do
      expect(described_class).to receive(:y_min).and_return(0)
      expect(described_class).to receive(:y_max).and_return(4)
      expect(described_class.valid_y?(5)).to eq(false)
    end
  end
end

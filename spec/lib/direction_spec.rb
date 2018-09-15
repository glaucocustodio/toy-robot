RSpec.describe Direction do
  subject { described_class.new(direction) }

  describe '#new_face_given' do
    let(:direction) { double(:direction) }

    context 'direction is left' do
      before do
        expect(subject).to receive(:left?).and_return(true)
      end

      context 'current face is north' do
        it do
          expect(subject.new_face_given('north')).to eq('west')
        end
      end

      context 'current face is west' do
        it do
          expect(subject.new_face_given('west')).to eq('south')
        end
      end

      context 'current face is south' do
        it do
          expect(subject.new_face_given('south')).to eq('east')
        end
      end

      context 'current face is east' do
        it do
          expect(subject.new_face_given('east')).to eq('north')
        end
      end
    end

    context 'direction is right' do
      before do
        expect(subject).to receive(:left?).and_return(false)
      end

      context 'current face is north' do
        it do
          expect(subject.new_face_given('north')).to eq('east')
        end
      end

      context 'current face is east' do
        it do
          expect(subject.new_face_given('east')).to eq('south')
        end
      end

      context 'current face is south' do
        it do
          expect(subject.new_face_given('south')).to eq('west')
        end
      end

      context 'current face is west' do
        it do
          expect(subject.new_face_given('west')).to eq('north')
        end
      end
    end
  end

  describe '#left?' do
    let(:direction) { "LEFT" }

    it do
      expect(subject.left?).to eq(true)
    end
  end

  describe '#right?' do
    let(:direction) { "right" }

    it do
      expect(subject.right?).to eq(true)
    end
  end
end

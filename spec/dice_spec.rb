#spec/dice_spec.rb
require_relative '../src/dice.rb'

RSpec.describe Dice do
  describe '#initilize' do
    context 'when initialized with incorrect number of arguments' do
      [[1,2], [1, 2, 3], [1, 2, 3, 4]].each do |args|
        it { expect { Dice.new(*args) }.to raise_error(ArgumentError) }
      end
    end

    context 'when initialized with incorrect type of arguments' do
      [[1.3], ["ff"]].each do |args|
        it { expect { Dice.new(*args) }.to raise_error(ArgumentError) }
      end
    end

    context 'when initialized with correct number of arguments and correct type' do
      it { expect(Dice.new(1)).to be_a(Dice) }
    end

    context 'when initialized with 0 sides, should default to 1' do
      it { expect(Dice.new(0).sides).to eq(1) }
    end

    context 'when initialized without argument' do
      it { expect(Dice.new.sides).to eq(1) }
    end    
  end

  describe '#roll' do
    subject { Dice.new(rand(1..20)) }
    it 'should have method roll' do
      expect(subject).to respond_to(:roll) 
    end

    context 'when called with correct number of arguments and correct type' do
      it { expect(subject.roll).to be_an(Integer) }
    end

    it 'should have value less than or equal to sides' do
      expect(subject.roll).to be <= subject.sides
    end
    it 'should have value grater than 0' do
      expect(subject.roll).to be > 0
    end
  end
end

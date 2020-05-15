require './enumerables.rb'
describe Enumerable do
  let(:my_each_test) { array.my_each { |x| x * 2 } }
  let(:my_each_with_index_test) { array.my_each_with_index { |x, i| "#{i}: #{x * 2}" } }
  let(:my_select_test) { range.my_select { |x| x % 3 == 0 } }

  describe '#my_each' do
    let(:array) { [1, 2, 3] }

    it 'it iterates the array' do
      expect(array.my_each).to be_a(Enumerator)
    end

    it 'Iterates through the array and executes block' do
      expect(my_each_test).to eq(array.each { |x| x * 2 })
    end
  end

  describe '#my_each_with index' do
    let(:array) { [1, 2, 3] }

    it 'it iterates the array' do
      expect(array.my_each_with_index).to be_a(Enumerator)
    end

    it 'Iterates through the array and executes block' do
      expect(my_each_with_index_test).to eq(array.each_with_index { |x, i| "#{i}: #{x * 2}" } )
    end
  end

  describe '#my_select' do
    let(:range) { (1..10) }
    let(:array) { [1, 2, 3] }
    let(:array_s) { %w[hello world] }

    it 'selects elements in a range divisible by 3' do
      expect(my_select_test).to eq(range.select { |x| x % 3 == 0 })
    end

    it 'returns even numbers' do
      expect(array.my_select(&:even?)).to eq(array.select(&:even?))
    end

    it 'returns selected words from list' do
      expect(array_s.my_select { |s| s == :hello }).to eq(array_s.select { |s| s == :hello })
    end
  end

  describe '#my_all?' do
    let(:array_n) { [1, 2i, 3.14] }
    let(:array_s) { %w[ant bear cat] }
    let(:array_nil) { [nil, true, 99] }

    it 'checks if block is met for all items in array for strings given block' do
      expect(array_s.my_all? { |word| word.length >= 4 }).to eq(array_s.all? { |word| word.length >= 4 })
    end

    it 'checks if condition is met for all items in array for strings given symbol' do
      expect(array_s.my_all?(/t/)).to eq(array_s.all?(/t/))
    end

    it 'checks if condition is met for all items in array for strings given numeric' do
      expect(array_n.my_all?(Numeric)).to eq(array_n.all?(Numeric))
    end

    it 'checks if condition is met for all items in array for strings given nil array' do
      expect(array_nil.my_all?).to eq(array_nil.all?)
    end

    it 'checks if condition is met for all items in array for strings given empty array' do
      expect([].my_all?).to eq([].all?)
    end
  end

  describe '#my_any?' do
    let(:array_n) { [1, 2i, 3.14] }
    let(:array_s) { %w[ant bear cat] }
    let(:array_nil) { [nil, true, 99] }

    it 'checks if block is met for atleast 1 item in array for strings given block' do
      expect(array_s.my_any? { |word| word.length >= 4 }).to eq(array_s.any? { |word| word.length >= 4 })
    end

    it 'checks if condition is met for atleast 1 item in array for strings given symbol' do
      expect(array_s.my_any?(/t/)).to eq(array_s.any?(/t/))
    end

    it 'checks if condition is met for atleast 1 item in array for strings given numeric' do
      expect(array_n.my_any?(Numeric)).to eq(array_n.any?(Numeric))
    end

    it 'checks if condition is met for atleast 1 item in array for strings given nil array' do
      expect(array_nil.my_any?).to eq(array_nil.any?)
    end

    it 'checks if condition is met for atleast 1 item in array for strings given empty array' do
      expect([].my_any?).to eq([].any?)
    end
  end

  describe '#my_none?' do
    let(:array_n) { [1, 2i, 3.14] }
    let(:array_s) { %w[ant bear cat] }
    let(:array_nil) { [nil, true, false] }

    it 'checks if condition is not met for all items in array for strings given empty array' do
      expect(array_s.my_none? { |word| word.length == 5 }).to eq(array_s.none? { |word| word.length == 5 })
    end

    it 'checks if condition is not met for all items in array for strings given empty array' do
      expect(array_s.my_none? { |word| word.length >= 4 }).to eq(array_s.none? { |word| word.length >= 4 })
    end

    it 'checks if condition is not met for all item in array for strings given symbol' do
      expect(array_s.my_none?(/d/)).to eq(array_s.none?(/d/))
    end

    it 'checks if condition is not met for all item in array for strings given numeric' do
      expect(array_n.my_none?(Float)).to eq(array_n.none?(Float))
    end

    it 'checks if condition is not met for all item in array for strings given nil array' do
      expect(array_nil.my_none?).to eq(array_nil.none?)
    end

    it 'checks if condition is not met for all item in array for strings given nil array' do
      expect([nil].my_none?).to eq([nil].none?)
    end

    it 'checks if condition is not met for all item in array for strings given nil array' do
      expect([nil, false].my_none?).to eq([nil, false].none?)
    end

    it 'checks if condition is not met for all item in array for strings given empty array' do
      expect([].my_none?).to eq([].none?)
    end
  end

  describe '#my_count' do
    let(:array) { [0, 0, 1, 2, 4, 2] }

    it 'counts number of elements based on condition' do
      expect(array.my_count).to eq(array.count)
    end

    it 'counts number of elements based on condition' do
      expect(array.my_count(0)).to eq(array.count(0))
    end

    it 'counts number of elements based on condition' do
      expect(array.my_count(&:even?)).to eq(array.count(&:even?))
    end
  end

  describe '#my_map' do
    let(:range) { (1..10) }

    it 'returns new array using and executes the condition onto item in array' do
      expect(range.my_map(&:to_s)).to eq(range.map(&:to_s))
    end

    it 'returns new array using and executes the condition onto item in array' do
      expect(range.my_map { |i| i * i }).to eq(range.map { |i| i * i })
    end

    it 'returns new array using and executes the condition onto item in array' do
      expect(range.my_map { 'cat' }).to eq(range.map { 'cat' })
    end
  end

  describe '#my_inject' do
    let(:range) { (1..10) }

    it 'executes condition on array and returns the answer using an accumulator' do
      expect(range.my_inject(:+)).to eq(range.inject(:+))
    end

    it 'executes block on array and returns answer using an accumulator' do
      expect(range.my_inject { |sum, x| sum + x }).to eq(range.inject { |sum, x| sum + x })
    end

    it 'uses starting value for accumulator and executes symbol on array and returns answer' do
      expect(range.my_inject(1, :*)).to eq(range.inject(1, :*))
    end

    it 'uses starting value for accumulator and executes block on array and returns answer' do
      expect(range.my_inject(1) { |sum, x| sum * x }).to eq(range.inject(1) { |sum, x| sum * x })
    end

    it 'executes block on array and returns answer using an accumulator' do
      expect(%w[cat sheep bear].my_inject { |memo, word| memo.length > word.length ? memo : word }).to eq(%w[cat sheep bear].inject { |memo, word| memo.length > word.length ? memo : word })
    end
  end
end

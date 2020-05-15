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
      expect(my_each_with_index_test).to eq(array.each { |x| x * 2 })
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
end

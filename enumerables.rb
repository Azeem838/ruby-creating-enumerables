module Enumerable
  def my_each()
    i = -1
    length.times do
      i += 1
      yield self[i]
    end
  end

  def my_each_with_index()
    i = -1
    length.times do
      i += 1
      yield self[i], i
    end
  end

  def my_select(&block)
    new_array = []
    my_each do |item|
      new_array << item if block.call(item) == true
    end
    new_array
  end

  def my_all?(&block)
    new_array = []
    my_each do |item|
      new_array << (block.call(item) == true ? 1 : 0)
    end
    count = 0
    new_array.my_each do |x|
      count += x
    end
    count == new_array.length
  end

  def my_any?(&block)
    new_array = []
    my_each do |item|
      new_array << (block.call(item) == true ? 1 : 0)
    end
    count = 0
    new_array.my_each do |x|
      count += x
    end
    count != 0
  end

  def my_none?(&block)
    new_array = []
    my_each do |item|
      new_array << (block.call(item) == true ? 1 : 0)
    end
    count = 0
    new_array.my_each do |x|
      count += x
    end
    count.zero?
  end

  def my_count(num = 0, &block)
    result = 0
    my_each do |item|
      if block_given? == false and item == num
        result += 1
      elsif block_given? and block.call(item) == true
        result += 1
      end
    end
    result != 0 ? result : my_each { |x| x }
  end

  def my_map(&block)
    new_array = []
    my_each do |item|
      new_array << block.call(item)
    end
    new_array
  end

  def my_inject(memo = nil)
    my_each do |item|
      memo = if memo.nil?
               item
             else
               yield(memo, item)
             end
    end
    memo
  end
end

def multiply_els(array)
  total = array.my_inject { |product, x| product * x }
  p total
end

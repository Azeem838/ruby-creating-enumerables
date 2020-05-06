module Enumerable
  def my_each()
    return to_enum(:my_each) unless block_given?

    i = -1
    arr = to_a
    arr.length.times do
      i += 1
      yield(arr[i])
    end
    self
  end

  def my_each_with_index()
    return to_enum(:my_each_with_index) unless block_given?

    i = -1
    arr = to_a
    arr.length.times do
      i += 1
      yield(arr[i], i)
    end
    self
  end

  def my_select()
    return to_enum(:my_select) unless block_given?

    new_array = []
    my_each do |item|
      new_array << item if yield(item) == true
    end
    new_array.empty? ? self : new_array
  end

  def my_all?(pattern = nil)
    my_each do |item|
      if block_given?
        return false unless yield(item)
      elsif pattern.nil?
        return false unless item
      else
        return false unless pattern === item
      end
    end
    true
  end

  def my_any?(pattern = nil)
    my_each do |item|
      if block_given?
        return true unless yield(item) == false
      elsif pattern.nil?
        return true unless item
      else
        return true unless (pattern === item) == false
      end
    end
    false
  end

  def my_none?(pattern = nil)
    new_array = []
    my_each do |item|
      new_array << if block_given?
                     (yield(item) == true ? 1 : 0)
                   elsif pattern.nil?
                     (item == true ? 1 : 0)
                   else
                     ((pattern === item) == true ? 1 : 0)
                   end
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

  def my_map(val = nil)
    return to_enum(:my_map) unless block_given?

    new_array = []
    my_each do |item|
      new_array << if val
                     val.call(item)
                   else
                     yield(item)
                   end
    end
    new_array
  end

  def my_inject(memo = nil, sym = nil)
    total = 0
    if block_given?
      my_each do |item|
        memo = memo.nil? ? item : yield(memo, item)
      end
    elsif sym and memo
      my_each do |item|
        memo = memo.nil? ? item : memo.send(sym, item)
      end
    else
      my_each do |item|
        total = total.send(memo, item)
      end
      return total
    end
    memo
  end
end

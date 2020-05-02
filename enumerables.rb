arr = [5, 2, 3]

module Enumerable
  def my_each(array)
    i = -1
    array.length.times do
      i += 1
      yield array[i]
    end
  end

  def my_each_with_index(array)
    i = -1
    array.length.times do
      i += 1
      yield array[i], i
    end
  end
end

arr.my_each_with_index(arr) { |x, ind| puts "#{x}, #{ind}" }

arr.each_with_index { |y, idx| puts "#{y}, #{idx}" }

arr = [5, 2, 3]

module Enumerable
  def my_each(array)
    i = -1
    array.length.times do
      i += 1
      yield array[i]
    end
  end
end

arr.my_each(arr) { |x| puts x * 10 }

arr.each { |y| puts y }

arr = [5, 2, 3, 8, 10, 14, 16]
word_list = %w[ant bear cat]

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
end
# arr.my_each { |x| puts x }
# arr.my_each_with_index { |idx, x| puts "#{idx}, #{x}" }

# p arr.my_select(&:even?)
# p arr.select(&:even?)

# puts(arr.my_all? { |x| x > 1 })
# p(word_list.my_all? { |x| x.length >= 4 })
# # puts(arr.all? { |x| x > 1 })

# p(word_list.my_any? { |x| x.length >= 4 })
# p(arr.any? { |x| x > 10 })

p(word_list.my_none? { |x| x.length >= 5 })
p(arr.my_none? { |x| x > 10 })

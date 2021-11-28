gets
t, a = gets.split.map(&:to_i)
list = gets.split.map(&:to_i)

define_method(:diff) do |x|
  (a - (t - x * 0.006)).abs
end

min = list.min { |a, b| diff(a) <=> diff(b) }
puts list.index(min) + 1

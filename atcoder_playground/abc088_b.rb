gets
list = gets.split.map(&:to_i)
list.sort_by! { |x| -x }

puts list.map.with_index(0) { |n, i| n * (i.even? ? 1 : -1) }.sum

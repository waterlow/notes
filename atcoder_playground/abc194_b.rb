# frozen_string_literal:true

n = gets.to_i

list = n.times.map do |i|
  a, b = gets.split.map(&:to_i)
  [i, a, b]
end

a1, a2 = list.sort_by { |_, a, _| a }.first(2)
b1, b2 = list.sort_by { |_, _, b| b }.first(2)

if a1.first != b1.first
  puts [a1[1], b1[2]].max
  return
end

puts [a1[1] + b1[2], [a1[1], b2[2]].max, [a2[1], b1[2]].max].min

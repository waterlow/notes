# frozen_string_literal:true

a, b, w = gets.split.map(&:to_i)

max_possible_count = w * 1000 / a
min_possible_count = (w * 1000 + b - 1) / b

if min_possible_count > max_possible_count
  puts('UNSATISFIABLE')
  return
end

puts("#{min_possible_count} #{max_possible_count}")

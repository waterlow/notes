require 'prime'
gets
list = gets.split.map(&:to_i)
puts list.map { |i| Prime.prime_division(i).find { |a, _| a == 2 }&.last || 0 }.min

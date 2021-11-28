# frozen_string_literal:true

n = gets.to_i
list = gets.split.map(&:to_i)
sum = 0
(2..n).each do |i|
  (1..i).each do |j|
    sum += (list[i-1] - list[j-1])**2
  end
end
puts sum

# gets
# list = gets.split.map(&:to_i)
# puts list.combination(2).sum(0) { |a, b| (a - b)**2 }

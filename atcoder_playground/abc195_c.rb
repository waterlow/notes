# frozen_string_literal:true

n_s = gets.chomp
n_i = n_s.to_i

max_comma_count = (n_s.length - 1) / 3

count = (n_i - 1000**max_comma_count + 1) * max_comma_count

(max_comma_count - 1).downto(1) do |comma_count|
  max = (1000**(comma_count + 1) - 1)
  min = 1000**comma_count
  count += (max - min + 1) * comma_count
end

puts count

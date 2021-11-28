# frozen_string_literal:true

n_str = gets.chomp
length = n_str.length
if length.odd?
  puts 10**(n_str.length / 2) - 1
else
  half_len = length / 2
  first_half = n_str[0, half_len].to_i
  last_half = n_str[half_len, half_len].to_i
  puts first_half <= last_half ? first_half : first_half - 1
end

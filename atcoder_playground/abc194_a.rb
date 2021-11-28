# frozen_string_literal:true

musikokei, nyusibou = gets.split.map(&:to_i)
nyukokei = musikokei + nyusibou

if nyukokei >= 15 && nyusibou >= 8
  puts 1
elsif nyukokei >= 10 && nyusibou >= 3
  puts 2
elsif nyukokei >= 3
  puts 3
else
  puts 4
end

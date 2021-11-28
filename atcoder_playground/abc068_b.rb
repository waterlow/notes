require 'prime'

n = gets.to_i
n.downto(1) do |i|
  result = Prime.prime_division(i)
  if result.size == 1 && result[0][0] == 2 || result.empty?
    puts i
    return
  end
end

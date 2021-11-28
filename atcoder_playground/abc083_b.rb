n, a, b = gets.split.map(&:to_i)
range = (a..b)

def sum_of_digits(n)
   sum = 0
   begin
     n, b = n.divmod(10)
     sum += b
   end until n == 0 and b == 0
   sum
end

sum = 0
n.times do |i|
  sum_of_i = sum_of_digits(i + 1)
  sum += i + 1 if range.cover?(sum_of_i)
end
puts sum

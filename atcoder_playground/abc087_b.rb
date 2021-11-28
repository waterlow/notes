n_500 = gets.to_i
n_100 = gets.to_i
n_50 = gets.to_i
total = gets.to_i

count = 0

(n_500 + 1).times do |i|
  s_500 = 500 * i
  (n_100 + 1).times do |j|
    s_100 = 100 * j
    (n_50 + 1).times do |k|
      s_50 = 50 * k
      count += 1 if s_500 + s_100 + s_50 == total
    end
  end
end

puts count

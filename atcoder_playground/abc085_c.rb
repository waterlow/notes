n, y = gets.split.map(&:to_i)

(n+1).times do |i|
  s_10000 = 10000 * i
  next if s_10000 > y
  next if s_10000 + 5000 * n-i < y

  (n-i+1).times do |j|
    s_5000 = 5000 * j
    s_1000 = 1000 * (n - i - j)

    if s_10000 + s_5000 + s_1000 == y
      puts "#{i} #{j} #{n - i - j}"
      return
    end
  end
end

puts "-1 -1 -1"

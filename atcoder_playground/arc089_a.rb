n = gets.to_i
list = n.times.map{ gets.split.map(&:to_i) }

list.each_with_index do |(t_c, x_c, y_c), i|
  t = i.zero? ? t_c : t_c - list[i-1][0]
  x = i.zero? ? x_c : x_c - list[i-1][1]
  y = i.zero? ? y_c : y_c - list[i-1][2]

  if !(t >= x.abs + y.abs && !(t.odd? ^ (x + y).odd?))
    puts 'No'
    return
  end
end

puts 'Yes'

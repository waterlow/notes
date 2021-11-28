s = gets.chomp.split('')
t = gets.chomp.split('')
puts((s.sort <=> t.sort.reverse) == -1 ? 'Yes' : 'No')

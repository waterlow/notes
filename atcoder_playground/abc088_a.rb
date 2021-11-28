y = gets.to_i
one_yen_count = gets.to_i
judge = !(y % 500 - one_yen_count).positive?
puts(judge ? 'Yes' : 'No')

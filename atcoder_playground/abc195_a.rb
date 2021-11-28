# frozen_string_literal:true

m, h = gets.split.map(&:to_i)
puts((h % m).zero? ? 'Yes' : 'No')

gets
list = gets.split.map(&:to_i).sort
puts list[-1] - list[0]

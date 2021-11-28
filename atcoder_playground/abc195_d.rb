# frozen_string_literal:true

n, _m, q = gets.split.map(&:to_i)
list = n.times.map do
  w, v = gets.split.map(&:to_i)
  [w, v]
end

x_list = gets.split.map(&:to_i)

q_list = q.times.map do
  l, r = gets.split.map(&:to_i)
  [l, r]
end

def report(list, x_list, l, r)
  p available_x_list = x_list.slice(l..r)
end

q_list.each do |l, r|
  report(list, x_list, l, r)
end

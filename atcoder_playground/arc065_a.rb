L = %w[dream dreamer erase eraser].map(&:reverse)

s = gets.chomp.reverse
loop do
  subed = nil
  L.each do |pattern|
    subed = s.sub!(/\A#{pattern}/, '')
    break if subed
  end
  break unless subed
end

puts(s == '' ? 'YES' : 'NO')

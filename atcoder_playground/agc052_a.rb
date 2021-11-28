t = gets.to_i
cases = t.times.map do
  n = gets.to_i
  s1 = gets.chomp
  s2 = gets.chomp
  s3 = gets.chomp
  [n, *[s1, s2, s3].sort_by(&:size)]
end

cases.each do |n, s1, s2, s3|
  s12 = s1*2
  s22 = s2*2
  s32 = s3*2
  (0..('1' * n).to_i(2)).each do |i|
    y = i.to_s(2).rjust(n, '0')
    x1 = "#{y}0#{y}"
    rxp = /#{x1.split('').join('.*')}/
    if rxp =~ s12 && rxp =~ s22 && rxp =~ s32
      puts x1
      break
    end

    x2 = "#{y}1#{y}"
    rxp = /#{x2.split('').join('.*')}/
    if rxp =~ s12 && rxp =~ s22 && rxp =~ s32
      puts x2
      break
    end
  end
end

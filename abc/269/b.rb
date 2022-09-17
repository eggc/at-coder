S = 10.times.map { gets.chomp }
a, b, c, d  = nil, nil, nil, nil

10.times do |i|
  10.times do |j|
    if a.nil? && S[i][j] == '#'
      a = i + 1
      c = j + 1
    end

    if d.nil? && j >= 1 && S[i][j - 1] == '#' && S[i][j] == '.'
      d = j
    end

    if b.nil? && a && S[i][j] == '.' && S[i - 1][j] == '#'
      b = i
    end
  end
end

a ||= 10
b ||= 10
c ||= 10
d ||= 10

puts "#{a} #{b}"
puts "#{c} #{d}"

S = gets.chars

x = -1
y = -1
k1 = -1
k2 = -1
r1 = -1
r2 = -1

S.each_with_index do |c, i|
  if c == 'K' && k1 == -1
    k1 = i
  elsif c == 'K'
    k2 = i
  end

  if c == 'R' && r1 == -1
    r1 = i
  elsif c == 'R'
    r2 = i
  end

  if c == 'B' && x == -1
    x = i
  elsif c == 'B'
    y = i
  end
end

if x.odd? && y.even? || x.even? && y.odd?
  if r1 < k1 && k1 < r2 || r1 < k2 && k2 < r2
    puts 'Yes'
    exit
  end
end

puts 'No'

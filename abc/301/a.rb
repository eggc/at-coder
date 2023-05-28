N = gets.to_i
S = gets

t = 0
a = 0
winner = nil

N.times do |i|
  case S[i]
  when 'A'
    a += 1
  when 'T'
    t += 1
  end

  if a == t
    winner = S[i] == 'A' ? 'T' : 'A'
  end
 end

puts(
  if a > t
    'A'
  elsif t > a
    'T'
  else
    winner
  end
)

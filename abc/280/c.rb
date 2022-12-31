S = gets
T = gets

T.size.times do |i|
  if S[i] == T[i]
    next
  else
    puts(i + 1)
    exit
  end
end

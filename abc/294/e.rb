L, N1, N2 = gets.split.map(&:to_i)

LA = N1.times.map { gets.split.map(&:to_i) }
LB = N2.times.map { gets.split.map(&:to_i) }

p1 = 0
p2 = 0
current = 0
answer = 0

loop do
  current

  shift = [LA[p1][1], LB[p2][1]].min

  if LA[p1][0] == LB[p2][0] # 文字が一緒の時
    answer += shift
    current += shift
  else
    current += shift
  end

end

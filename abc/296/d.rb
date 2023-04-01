N, M = gets.split.map(&:to_i)
MAX = N * N + 1

answer = MAX

1.upto(N) do |a|
  b = Rational(M, a).ceil

  break if b < a
  next if b > N

  answer = [a * b, answer].min
end

puts((answer == MAX) ? -1 : answer)

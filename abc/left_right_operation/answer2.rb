N, L, R = gets.split(' ').map(&:to_i)
A = gets.split(' ').map(&:to_i)

F = []
G = []

(N+1).times do |i|
  if i == 0
    F[i] = 0
  else
    F[i] = [F[i-1] + A[i-1], L * i].min
  end
end

A.reverse!

(N+1).times do |i|
  if i == 0
    G[i] = 0
  else
    G[i] = [G[i-1] + A[i-1], R * i].min
  end
end

answer = (0..N).map { |i| F[i] + G[-i-1] }.min

puts(answer)

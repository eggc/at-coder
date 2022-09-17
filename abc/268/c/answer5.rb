N = gets.to_i
P = gets.chomp.split(" ").map(&:to_i)

# i 回転したときの料理が的中した数
C = Array.new(N, 0)

N.times do |i|
  C[(P[i] - i - 1) % N] += 1
  C[(P[i] - i)     % N] += 1
  C[(P[i] - i + 1) % N] += 1
end

puts C.max

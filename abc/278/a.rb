N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

K.times do
  A.shift
  A << 0
end

puts A.join(' ')

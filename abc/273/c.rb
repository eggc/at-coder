N = gets.to_i
A = gets.split.map(&:to_i)

hints = A.sort
hints.uniq!

hints_hash = {}
hints.each_with_index do |v, i|
  hints_hash[v] = hints.length - i - 1
end

weights = Array.new(N, 0)

N.times do |i|
  weights[i] = hints_hash[A[i]]
end

answers = Array.new(N, 0)
weights.each do |weight|
  answers[weight] += 1
end

puts answers

N = gets.to_i
A = gets.split.map(&:to_i)

memo = {}
answer = 0

A.each do |i|
  if memo[i]
    memo[i] = nil
    answer += 1
  else
    memo[i] = true
  end
end

puts answer

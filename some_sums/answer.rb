N, A, B = gets.split(" ").map(&:to_i)
answer = 0

def summary(n)
  n.to_s.split('').map(&:to_i).sum
end

(1..N).each do |n|
  sum = summary(n)

  if A <= sum && sum <= B
    answer += n
  end
end

puts(answer)

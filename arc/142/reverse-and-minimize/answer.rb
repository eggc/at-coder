N, K = gets.split(" ").map(&:to_i)

def answer_count(current)
  answer = 0

  loop do
    if current <= N
      answer += 1
      current = current * 10
    else
      return answer
    end
  end
end

k1 = K.to_s.reverse.to_i

if k1 < K
  puts 0
elsif k1 == K
  puts answer_count(K)
else
  puts answer_count(K) + answer_count(K.to_s.reverse.to_i)
end

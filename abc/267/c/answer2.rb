N, M = gets.chomp.split(" ").map(&:to_i)
A = gets.chomp.split(" ").map(&:to_i)
S = [A[0]]

N.times { |i| S[i] = S[i-1] + A[i] if i > 0 }

answer = nil
start_index = 0
sum = 0

def partial_sum(sum_array, start_index, end_index)
  if start_index >= 0
    sum_array[end_index] - sum_array[start_index]
  else
    sum_array[end_index]
  end
end

loop do
  if start_index == 0
    A[start_index...(start_index+M)].each_with_index do |a, i|
      sum += (i + 1) * a
    end
  else
    # 最初の要素と、部分和を引いて、最後の要素を足す
    sum -= partial_sum(S, start_index - 2, start_index + M - 2)
    sum += M * A[start_index + M - 1]
  end

  if answer.nil? || answer < sum
    answer = sum
  end

  start_index += 1

  break if start_index > N - M
end

puts(answer)

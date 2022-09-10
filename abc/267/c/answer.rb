N, M = gets.chomp.split(" ").map(&:to_i)
A = gets.chomp.split(" ").map(&:to_i)

answer = nil
start_index = 0

loop do
  sum = 0

  A[start_index...(start_index+M)].each_with_index do |a, i|
    sum += (i + 1) * a
  end

  if answer.nil? || answer < sum
    answer = sum
  end

  start_index += 1

  break if start_index > N - M
end

puts(answer)

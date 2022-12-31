N = gets.to_i
S = gets.split.map(&:to_i)

answer = []

S.each_index do |i|
  if i == 0
    answer[i] = S[i]
  else
    answer[i] = S[i] - S[i-1]
  end
end

puts answer.join(' ')

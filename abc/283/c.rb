S = gets.chomp.chars

answer = 0
i = 0

loop do
  if S[i].nil?
    break
  elsif S[i] == '0' && S[i+1] == '0'
    answer += 1
    i += 2
  else
    answer += 1
    i += 1
  end
end

puts answer

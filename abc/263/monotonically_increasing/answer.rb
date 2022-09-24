N, M = gets.split(' ').map(&:to_i)
K = M - N

answer_array = []
base_array = (1..M).to_a

base_array.combination(K) do |combi|
  answer_array << base_array - combi
end

answer_array.sort!

answer_array.each do |answer|
  puts(answer.join(' '))
end

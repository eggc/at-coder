require 'prime'

K = gets.to_i

factors = K.prime_division

answer = factors.max_by { |x| x.first }&.first || 1
permutation = (1..answer).inject(:*)

i = permutation / K

loop do
  p [answer, permutation]
  value = K * i

  if permutation == value
    puts(answer)
    exit
  elsif permutation > value
    i += 1
  else
    answer += 1
    permutation *= answer
  end
end

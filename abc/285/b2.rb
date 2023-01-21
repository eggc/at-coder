# frozen_string_literal: true

N = gets.to_i
S = gets.chomp.chars

1.upto(N - 1) do |i|
  j = 0
  j += 1 while j < N - i && S[j] != S[j + i]
  p j
end

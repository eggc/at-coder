# frozen_string_literal: true

N, A, B = gets.split.map(&:to_i)
S = gets.chomp.chars

answer = Float::INFINITY

(N-1).times do |i|
  current = i * A

  (N/2).times do |j|
    if S[j] != S[-j-1]
      current += B
    end

    break if current > answer
  end

  if current < answer
    answer = current
  end

  S.rotate!
end

puts answer

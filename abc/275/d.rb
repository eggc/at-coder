# frozen_string_literal: true

N = gets.to_i

MEMO = []

(N+1).times do |k|
  if k == 0
    MEMO[k] = 1
  else
    MEMO[k] = MEMO[k/2] + MEMO[k/3]
  end
end

puts MEMO[N]

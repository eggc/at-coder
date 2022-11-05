# frozen_string_literal: true

N = gets.to_i

MEMO = { 0 => 1 }

def func(k)
  if MEMO[k]
    MEMO[k]
  else
    MEMO[k] = func(k/2) + func(k/3)
  end
end

puts func(N)

# frozen_string_literal: true

N, K = gets.chomp.split(' ').map(&:to_i)
A = gets.chomp.split(' ').map(&:to_i)

def step(current)
  (K - 1).downto(0) do |i|
    if A[i] * 3 <= current
      return A[i]
    elsif i.positive? && A[i - 1] * 2 + A[i] < current
      return A[i - 1]
    elsif A[i] <= current
      return A[i]
    end
  end
end

current = N
takahashi = 0

while current.positive?
  value = step(current)
  current -= value
  takahashi += value

  break unless current.positive?

  # 相手のターン
  value = step(current)
  current -= value
end

puts takahashi

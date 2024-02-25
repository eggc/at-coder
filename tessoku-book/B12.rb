# frozen_string_literal: true

N = gets.to_i
MAX = Math.cbrt(N).ceil

def binary_search(left, right)
  center = (right - left) / 2.0 + left
  n = center**3 + center

  if (n - N).abs <= 0.001
    center
  elsif n < N
    binary_search(center, right)
  else
    binary_search(left, center)
  end
end

puts binary_search(0, MAX)

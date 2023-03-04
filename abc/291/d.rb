# frozen_string_literal: true

N = gets.to_i
@a = []
@b = []

N.times do
  a, b = gets.split.map(&:to_i)
  @a << a
  @b << b
end

tail_a = @a[0]
tail_b = @b[0]
num_a = 1
num_b = 1

1.upto(N - 1) do |i|
  next_a = 0
  next_a += num_a unless tail_a == @a[i]
  next_a += num_b unless tail_b == @a[i]

  next_b = 0
  next_b += num_a unless tail_a == @b[i]
  next_b += num_b unless tail_b == @b[i]

  num_a = next_a % 998_244_353
  num_b = next_b % 998_244_353
  tail_a = @a[i]
  tail_b = @b[i]
end

puts((num_a + num_b) % 998_244_353)

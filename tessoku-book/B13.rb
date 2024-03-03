# frozen_string_literal: true

N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

@current = 0
@tails = []
@sums = []

while @current < N
  tail = 0
  sum = 0

  if @current > 0
    tail = @tails[@current - 1]
    sum = @sums[@current - 1] - A[@current - 1]
  end

  while tail < N && sum + A[tail] <= K
    sum += A[tail]
    tail += 1
  end

  @tails[@current] = tail
  @sums[@current] = sum
  @current += 1
end

answer = 0

@tails.each_with_index do |i2, i1|
  answer += (i2 - i1)
end

puts(answer)

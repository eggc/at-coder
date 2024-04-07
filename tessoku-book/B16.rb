# frozen_string_literal: true

N = gets.to_i
H = gets.split.map(&:to_i)

@dp = [0, (H[1] - H[0]).abs]

2.upto(N - 1) do |i|
  @dp[i] = [
    @dp[i - 1] + (H[i] - H[i - 1]).abs,
    @dp[i - 2] + (H[i] - H[i - 2]).abs
  ].min
end

puts @dp[N - 1]

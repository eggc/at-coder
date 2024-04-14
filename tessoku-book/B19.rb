# frozen_string_literal: true

N, W = gets.split.map(&:to_i)
V = 1000 * N
tmp = N.times.map { gets.split.map(&:to_i) }
WEIGHTS = tmp.map(&:first)
VALUES = tmp.map(&:last)

@dp = Array.new(N + 1) { Array.new(V + 1) }
@dp[0][0] = 0

N.times do |i|
  (V + 1).times do |j|
    next if @dp[i][j].nil?

    @dp[i + 1][j] = [
      @dp[i][j],
      @dp[i + 1][j]
    ].compact.min

    next if @dp[i][j] + WEIGHTS[i] > W

    @dp[i + 1][j + VALUES[i]] = [
      @dp[i + 1][j + VALUES[i]],
      @dp[i][j] + WEIGHTS[i]
    ].compact.min
  end
end

puts @dp[N].rindex(&:itself)

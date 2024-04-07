# frozen_string_literal: true

N, S = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

@dp = Array.new(N + 1) { Array.new(S + 1, false) }
@dp[0][0] = true

N.times do |i|
  (S + 1).times do |j|
    @dp[i + 1][j] =
      @dp[i][j] ||
      j - A[i] >= 0 && @dp[i][j - A[i]]
  end
end

if @dp[N][S]
  result = []
  current = S

  N.downto(1) do |i|
    if current - A[i - 1] >= 0 && @dp[i - 1][current - A[i - 1]]
      result << i
      current -= A[i - 1]
    end
  end

  puts(result.size)
  puts(result.join(' '))
else
  puts(-1)
end

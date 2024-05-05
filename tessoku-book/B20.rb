# frozen_string_literal: true

S = gets.chomp
T = gets.chomp

N = S.size + 1
M = T.size + 1

@dp = N.times.map { Array.new(M, 0) }

N.times do |i|
  M.times do |j|
    @dp[i][j] = if i == 0
                  j
                elsif j == 0
                  i
                else
                  [
                    @dp[i - 1][j] + 1,
                    @dp[i][j - 1] + 1,
                    @dp[i - 1][j - 1] + (S[i - 1] == T[j - 1] ? 0 : 1)
                  ].min
                end
  end
end

p @dp[N - 1][M - 1]

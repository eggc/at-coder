# frozen_string_literal: true

S = gets.chomp
T = gets.chomp

@dp = Array.new(S.size + 1) { Array.new(T.size + 1) }

(S.size + 1).times do |i|
  (T.size + 1).times do |j|
    @dp[i][j] = if i == 0 || j == 0
                  0
                elsif S[i - 1] == T[j - 1]
                  [
                    @dp[i - 1][j - 1] + 1,
                    @dp[i - 1][j],
                    @dp[i][j - 1]
                  ].max
                else
                  [@dp[i - 1][j], @dp[i][j - 1]].max
                end
  end
end

p @dp[S.size][T.size]

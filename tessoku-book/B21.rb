# frozen_string_literal: true

N = gets.to_i
S = gets.chomp.insert(0, ' ')

@dp = Array.new(N + 1) { Array.new(N + 1) }

1.upto(N) do |i|
  @dp[i][i] = 1
end

1.upto(N - 1) do |i|
  @dp[i][i + 1] = S[i] == S[i + 1] ? 2 : 1
end

2.upto(N) do |diff|
  1.upto(N - diff) do |left|
    right = diff + left

    @dp[left][right] =
      if S[left] == S[right]
        [
          @dp[left + 1][right - 1] + 2,
          @dp[left + 1][right],
          @dp[left][right - 1]
        ].max
      else
        [
          @dp[left + 1][right],
          @dp[left][right - 1]
        ].max
      end
  end
end

p @dp[1][N]

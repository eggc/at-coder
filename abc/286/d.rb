# frozen_string_literal: true

N, X = gets.split.map(&:to_i)
coins = $stdin.map { |line| line.split(' ').map(&:to_i) }

MEMO = Array.new(X + 1) { Array.new(coins.size) }
MEMO[0].fill(true)

1.upto(X) do |i|
  N.times do |j|
    coin, coin_number = coins[j]

    # コインを追加しなくても支払可能
    if j - 1 >= 0 && MEMO[i][j - 1]
      MEMO[i][j] = true
      next
    end

    1.upto(coin_number) do |k|
      amount = coin * k

      # コインを追加することで支払可能
      if i == amount || (j - 1 >= 0 && i - amount >= 0 && MEMO.dig(i - amount, j - 1))
        MEMO[i][j] = true
        break
      end
    end
  end
end

# MEMO.each_with_index { |a, i| p [i, *a].join(', ') }

puts MEMO[X].last ? 'Yes' : 'No'

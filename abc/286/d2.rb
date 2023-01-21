# frozen_string_literal: true

N, X = gets.split.map(&:to_i)
coin_array = $stdin.flat_map do |line|
  coin, number = line.split(' ').map(&:to_i)
  [coin] * number
end

MEMO = Array.new(X + 1) { Array.new(coin_array.size) }

(X + 1).times do |i|
  coin_array.size.times do |j|
    c = coin_array[j]

    next unless i == c ||
                (j - 1 >= 0 && MEMO[i][j - 1]) || # c を追加しなくても支払可能
                (j - 1 >= 0 && i - c >= 0 && MEMO.dig(i - c, j - 1)) # c を追加することで支払可能

    MEMO[i][j] = true
  end
end

puts MEMO[X].last ? 'Yes' : 'No'

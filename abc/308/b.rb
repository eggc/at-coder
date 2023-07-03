N, M = gets.split.map(&:to_i)
C = gets.split
D = gets.split
PRICES = gets.split.map(&:to_i)

price_hash = M.times.to_h do |i|
  [D[i], PRICES[i+1]]
end

puts(C.sum { |color| price_hash[color] || PRICES[0] })

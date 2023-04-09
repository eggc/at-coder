S = gets.chomp.chars.map(&:to_i)
BITS = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]

memo = []

S.length.times do |r|
  if r == 0
    memo << BITS[S[0]]
  else
    memo << (memo.last ^ BITS[S[r]])
  end
end

memo << 0

p memo.tally.sum { |_, count| count * (count - 1) / 2 }

S = gets.chomp

(S.length / 2).times do |i|
  S[2 * i + 1], S[2 * i] = S[2 * i], S[2 * i + 1]
end

puts S

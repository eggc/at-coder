A, B, C, D, E, F = gets.split.map(&:to_i)

answer = ((A * B * C) - (D * E * F)) % 998244353

puts answer

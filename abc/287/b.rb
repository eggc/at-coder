N, M = gets.split.map(&:to_i)
S = N.times.map { gets.chomp }
T = M.times.map { gets.chomp }

puts S.count { |s| T.any? { |t| s.end_with?(t) } }

N, K = gets.split.map(&:to_i)
S = $stdin.map { |line| line.chomp }
S.first(K).sort.each do |k|
  puts k
end

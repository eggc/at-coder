N = gets.to_i
S = $stdin.map { |line| line.chomp }

N.times do |i|
  puts S[N-1-i]
end

N = gets.to_i
S = $stdin.map { |line| line.chomp.split(' ').map(&:to_i) }
S.each do |a, b|
  puts(a+b)
end

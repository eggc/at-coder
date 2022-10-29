H, W = gets.split.map(&:to_i)
C = $stdin.map { |line| line.chomp.split('') }

counts = C.transpose.map do |line|
  line.count do |char|
    char == '#'
  end
end

puts counts.join(' ')

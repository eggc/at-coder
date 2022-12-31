H, W = gets.split.map(&:to_i)
S = $stdin.map { |line| line.chomp.split('') }

answer = 0

S.each do |row|
  row.each do |x|
    if x == '#'
      answer += 1
    end
  end
end

puts answer

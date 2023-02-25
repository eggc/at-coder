N, K = gets.split.map(&:to_i)
S = gets.chomp

current_winner = 0

S.each_char do |char|
  if char == 'o'
    if current_winner < K
      current_winner += 1
      print 'o'
    else
      print 'x'
    end
  else
    print 'x'
  end
end

puts ''

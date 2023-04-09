H, W = gets.split.map(&:to_i)
S = $stdin.map { |line| line.chomp.chars }

H.times do |i|
  1.upto(W-1) do |j|
    if S[i][j-1] == S[i][j] && S[i][j] == 'T'
      S[i][j-1] = 'P'
      S[i][j] = 'C'
    end
  end
end

S.each do |row|
  puts row.join('')
end

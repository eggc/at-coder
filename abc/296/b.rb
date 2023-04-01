S = $stdin.map { |i| i.chomp.split('') }

8.times do |i|
  8.times do |j|
    if S[i][j] == '*'
      name = ('a'.ord + (j)).chr
      puts "#{name}#{8-i}"
    end
  end
end

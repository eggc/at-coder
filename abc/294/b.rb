H, W = gets.split.map(&:to_i)
A = $stdin.map { |line| line.chomp.split(' ').map(&:to_i) }

A.each do |row|
  str = row.map do |column|
    if column == 0
      '.'
    else
      ('A'.ord + column - 1).chr
    end
  end

  puts str.join
end

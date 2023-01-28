N = gets.to_i
S = $stdin.map { |line| line.chomp }

if S.count { |x| x == 'For' } > N/2
  puts "Yes"
else
  puts "No"
end

N = gets.to_i
S = gets.chomp

if S == "BA" || S == "AB"
  puts "No"
elsif S[0] == 'A' && S[-1] == 'A'
  puts 'Yes'
elsif S[0] == 'A' && S[-1] == 'B'
  puts "No"
elsif S[0] == 'B'
  puts 'Yes'
end

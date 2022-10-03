N = gets.to_i

str = N.to_s(16).upcase

if str.length <= 1
  puts "0#{str}"
else
  puts str
end

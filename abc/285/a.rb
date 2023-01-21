a, b = gets.split.map(&:to_i)

if a * 2 == b || a * 2 + 1 == b
  puts "Yes"
else
  puts "No"
end

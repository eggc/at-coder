N = gets.to_i
S = gets.chars

ok = false

S.each do |char|
  if char == 'x'
    puts 'No'
    exit
  elsif char == 'o'
    ok = true
  end
end

if ok
  puts 'Yes'
else
  puts 'No'
end

N = gets.to_i
S = gets

prev = ''

S.each_char do |c|
  if c == prev
    puts 'No'
    exit
  else
    prev = c
  end
end

puts 'Yes'

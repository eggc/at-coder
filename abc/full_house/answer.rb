CARDS = gets.split(' ').map(&:to_i)

count = CARDS.tally

if count.any? { |k, v| v == 3 } && count.any? { |k, v| v == 2 }
  puts('Yes')
else
  puts('No')
end

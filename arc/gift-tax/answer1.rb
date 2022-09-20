N, A, B = gets.split(" ").map(&:to_i)
items = gets.split(" ").map(&:to_i)
items.sort!

loop do
  i = items.index(items.min)
  j = items.index(items.max)

  if items[i] > items[j] - B
    break
  else
    items[i] += A
    items[j] -= B
  end
end

puts(items.min)

N, A, B = gets.split(" ").map(&:to_i)
items = gets.split(" ").map(&:to_i)
items.sort!

loop do
  puts items.join(",")
  i = 0
  j = items.length - 1

  if items[i] > items[j] - B
    break
  else

    # 順序の崩壊が起きるまでやる
    while items[i] < items[i+1] && items[j-1] < items[j]
      items[i] += A
      items[j] -= B
    end

    items.sort!
  end
end

puts(items.min)

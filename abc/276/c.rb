# frozen_string_literal: true

N = gets.to_i
P = gets.split.map(&:to_i)

# 単調増加になってない位置を探す
index = N-1

N.times do
  if P[index-1] > P[index]
    index -= 1
    break
  else
    index -= 1
  end
end

head = P[0...index]
tail = P[index..-1]

next_tail_top = nil

sorted_tail = tail.sort
sorted_tail.each_cons(2) do |a, b|
  if b == tail[0]
    next_tail_top = a
  end
end

sorted_tail -= [next_tail_top]

puts [*head, next_tail_top, *sorted_tail.reverse].join(" ")

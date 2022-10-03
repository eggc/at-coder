# frozen_string_literal: true

require 'set'

N = gets.to_i
A = gets.split.map(&:to_i)
A.sort!

answer = 0
current_length = N

puts(A.join("-"))

N.times do |i|

  puts([i, A[i], i + 1].join("-"))

  if A[i] == i + 1
    # 何もせず大丈夫
    answer = i + 1
    next
  elsif i <= current_length - 2
    # 売却を試みる
    A.pop(2)
    current_length -= 1
    answer = i + 1
  else
    # 売却できないので終わり
    break
  end
end

puts(answer)

# frozen_string_literal: true

N = gets.to_i
A = gets.split.map(&:to_i)
Q = gets.to_i
X = Q.times.map { gets.to_i }

A.sort!

X.each do |x|
  i = A.bsearch_index { x <= _1 }
  puts(i || N)
end

# frozen_string_literal: true

N = gets.to_i
A = gets.split.map(&:to_i)

A.sort!
A.reverse!

large_evens = []
large_odds = []

A.each do |a|
  if a.even? && large_evens.length < 2
    large_evens << a
  elsif large_odds.length < 2
    large_odds << a
  end
end

if large_evens.length < 2 && large_odds.length < 2
  puts(-1)
else
  puts [large_evens.sum, large_odds.sum].max
end

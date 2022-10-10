# frozen_string_literal: true

n = gets.to_i
k = gets.to_i
cards = $stdin.map(&:to_i)

patterns = cards.permutation(k).map do |cards_subset|
  cards_subset.join.to_i
end

puts(patterns.uniq.size)

# frozen_string_literal: true

N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
total_score = A.sum
tally = A.tally

answer = total_score

tally.each do |key, count|
  x = (key + 1) % M
  droped_score = x * count

  loop do
    break unless tally[x]

    droped_score += (x * count)
    x = (x + 1) % M
  end

  score = total_score - droped_score
  answer = [score, answer].min
end

puts answer

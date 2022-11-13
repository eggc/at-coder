# frozen_string_literal: true

N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

tally = A.tally.to_a.sort_by { |x, _y| x }
size = tally.size

start_index = size.times.find do |i|
  (tally[i][0] + 1) % M != tally[(i + 1) % size][0]
end

if start_index.nil?
  puts 0
else
  scores = Array.new(size, nil)

  size.times do |i|
    j = (size + start_index - i) % size # 正の数になるように下駄を履かせている
    k = (j + 1) % size
    score = tally[j][0] * tally[j][1]

    scores[j] = if (tally[j][0] + 1) % M == tally[k][0]
                  scores[k] + score
                else
                  score
                end
  end

  puts A.sum - scores.max
end

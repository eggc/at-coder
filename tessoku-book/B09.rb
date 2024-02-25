# frozen_string_literal: true

N = gets.to_i
M = N.times.map { gets.split.map(&:to_i) }
MAX = 1501

@memo = Array.new(MAX) { Array.new(MAX, 0) }
@answer = 0

M.each do |a, b, c, d|
  @memo[b][a] += 1
  @memo[b][c] += -1
  @memo[d][a] += -1
  @memo[d][c] += 1
end

(MAX - 1).times do |i|
  (MAX - 1).times do |j|
    @memo[i][j + 1] += @memo[i][j]
  end
end

(MAX - 1).times do |j|
  (MAX - 1).times do |i|
    @memo[i + 1][j] += @memo[i][j]
  end
end

(MAX - 1).times do |i|
  (MAX - 1).times do |j|
    @answer += 1 if @memo[i][j] > 0
  end
end

puts(@answer)

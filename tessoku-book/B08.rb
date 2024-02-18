# frozen_string_literal: true

# 2D array cumulative sum

N = gets.to_i
POINTS = N.times.map { gets.split.map(&:to_i) }
Q = gets.to_i
QUESTIONS = Q.times.map { gets.split.map(&:to_i) }

MAX = POINTS.flatten.max

@z = Array.new(MAX + 1) { Array.new(MAX + 1, 0) }

POINTS.each { |x, y| @z[y][x] += 1 }

MAX.times do |i|
  MAX.times do |j|
    @z[i + 1][j + 1] += @z[i + 1][j]
  end
end

MAX.times do |j|
  MAX.times do |i|
    @z[i + 1][j + 1] += @z[i][j + 1]
  end
end

QUESTIONS.each do |(x1, y1, x2, y2)|
  puts(@z[y2][x2] - @z[y1 - 1][x2] - @z[y2][x1 - 1] + @z[y1 - 1][x1 - 1])
end

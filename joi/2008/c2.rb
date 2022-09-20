# frozen_string_literal: true

N, M = gets.chomp.split(' ').map(&:to_i)
POINTS = N.times.map { gets.to_i }

double_points = []

points = [0, *POINTS].sort
points.each do |x|
  points.each do |y|
    sum = x + y
    double_points << sum if sum < M
  end
end

double_points.sort!
double_points.uniq!

max_point = 0
double_points.each do |i|
  # find-minimum mode で M を超える最小の値の一個手前を選ぶ
  index = double_points.bsearch_index { |x| x + i >= M } || 0
  point = index.zero? ? i : i + double_points[index - 1]
  max_point = [point, max_point].max
end

puts(max_point)

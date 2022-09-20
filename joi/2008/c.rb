# frozen_string_literal: true

N, M = gets.chomp.split(' ').map(&:to_i)
POINTS = N.times.map { gets.to_i }

points = [0, *POINTS].sort

max_point = 0

points.each do |i|
  points.each do |j|
    points.each do |k|
      sum = i + j + k

      # find-minimum mode で M を超える最小の値の一個手前を選ぶ
      index = points.bsearch_index { |x| x + sum >= M } || 0

      max_point = [max_point, sum + points[index - 1]].max if index.positive?
    end
  end
end

puts(max_point)

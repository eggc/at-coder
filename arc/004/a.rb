# frozen_string_literal: true

require 'matrix'

N = gets.to_i
VECTORS = N.times.map do
  point = gets.chomp.split(' ').map(&:to_i)
  Vector[*point]
end

max = 0
VECTORS.each do |v1|
  VECTORS.each do |v2|
    max = [max, (v1 - v2).norm].max
  end
end

puts(max)

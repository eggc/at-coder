# frozen_string_literal: true

require 'set'

N, T = gets.split.map(&:to_i)
C = gets.split.map(&:to_i)
R = gets.split.map(&:to_i)

target_color =
  if C.include?(T)
    T
  else
    C[0]
  end

target_indexes = []

C.each_with_index do |color, i|
  target_indexes << i if color == target_color
end

answer = (target_indexes.max_by { |i| R[i] }) + 1

puts answer

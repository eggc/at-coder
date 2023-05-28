# frozen_string_literal: true
require 'set'

N, M = gets.split.map(&:to_i)
A = $stdin.map { |line| line.split.map(&:to_i) }

# 隣り合ったことのある人のリスト
# [x,y] と [y,x] は同じものとして数えるため小さい順にする

pairs = A.flat_map do |x|
  x.each_cons(2).map do |a, b|
    a < b ? [a, b] : [b, a]
  end
end

puts((N * (N - 1)) / 2 - pairs.uniq.size)

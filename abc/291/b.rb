# frozen_string_literal: true

N = gets.to_i
X = gets.split.map(&:to_i)
X.sort!

p X[N..(-1 - N)].sum.to_f / (N*3)

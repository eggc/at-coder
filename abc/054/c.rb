# frozen_string_literal: true

require 'set'

N, M = gets.split.map(&:to_i)

edges = Set.new

$stdin.map do |line|
  ai, bi = line.split.map(&:to_i)
  edges << [ai, bi]
  edges << [bi, ai]
end

answer = 0

(1..N).to_a.permutation do |nodes|
  next if nodes.first != 1

  answer += 1 if nodes.each_cons(2).all? { |pair| edges.include?(pair) }
end

puts(answer)

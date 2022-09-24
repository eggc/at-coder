# frozen_string_literal: true

require 'set'

N, M = gets.chomp.split(' ').map(&:to_i)
RELATIONS = M.times.map { gets.chomp.split(' ').map(&:to_i) }.to_set

answer = 0

[true, false].repeated_permutation(N).each do |flags|
  members = flags.filter_map.with_index { |flag, i| i + 1 if flag }
  answer = [answer, members.size].max if members.combination(2).all? { |combi| RELATIONS.include?(combi) }
end

puts answer

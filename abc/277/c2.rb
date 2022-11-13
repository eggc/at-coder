# frozen_string_literal: true

require "set"

N = gets.to_i
A_B = $stdin.map { |line| line.split(' ').map(&:to_i) }

ladders = {}

A_B.each do |from, to|
  ladders[from] ||= []
  ladders[from] << to

  ladders[to] ||= []
  ladders[to] << from
end

def bf_search(ladders, start)
  queue = Set.new([start])
  visited = {}
  max = start

  until queue.empty?
    node = queue.first
    queue.delete(node)

    visited[node] = true
    ladders[node]&.each do |child|
      max = child if max < child

      queue << child unless visited[child]
    end
  end

  max
end

puts bf_search(ladders, 1)

# frozen_string_literal: true

N = gets.to_i
A_B = $stdin.map { |line| line.split(' ').map(&:to_i) }

LADDERS = {}
VISITED = {}

A_B.each do |from, to|
  LADDERS[from] ||= []
  LADDERS[from] << to
  LADDERS[to] ||= []
  LADDERS[to] << from
end

def search(node)
  max = node

  LADDERS[node]&.each do |child|
    result = VISITED[child] || search(child)

    max = result if result > max
  end

  VISITED[node] = max
end

puts(search(1))

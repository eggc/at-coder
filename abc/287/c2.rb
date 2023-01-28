# frozen_string_literal: true

N, M  = gets.split.map(&:to_i)
EDGES = {}
VISITED = Array.new(N + 1)
VISITED[0] = true

current = nil

$stdin.each do |line|
  a, b = line.chomp.split(' ').map(&:to_i)

  EDGES[a] ||= []
  EDGES[a] << b
  EDGES[b] ||= []
  EDGES[b] << a
end

EDGES.each do |node, next_nodes|
  if next_nodes.length == 1
    current = node
  elsif next_nodes.empty? || next_nodes.length > 2
    puts 'No'
    exit
  end
end

while current
  VISITED[current] = true
  edges = EDGES[current]
  current = edges.find { |x| !VISITED[x] }
end

if VISITED.all? { |x| x }
  puts 'Yes'
else
  puts 'No'
end

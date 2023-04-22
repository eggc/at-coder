# frozen_string_literal: true

require 'set'

class UndirectedGraph
  attr_reader :size

  def initialize(size)
    @size = size
    @edges = Array.new(size + 1)
    @degrees = Array.new(size + 1, 0)
  end

  def degree(i)
    @degrees[i]
  end

  def add_edge(a, b)
    @edges[a] ||= []
    @edges[a] << b

    @edges[b] ||= []
    @edges[b] << a

    @degrees[a] += 1
    @degrees[b] += 1
  end

  def remove_edge(a, b)
    @edges[a].delete(b)
    @edges[b].delete(a)

    @degrees[a] -= 1
    @degrees[b] -= 1
  end

  def children(a)
    @edges[a] || []
  end

  def each_node(&block)
    (1..size).each(&block)
  end

  def inspect
    each_node.map do |i|
      str = format('%2d', i)
      str << format('(%d)', @degrees[i])
      str << ' => '
      str << (@edges[i]&.join(', ') || '')
    end.join("\n")
  end
end

def search(start_node, distance)
  q = [start_node]
  visited = { start_node => 0 }

  until q.empty?
    node = q.shift

    next if visited[node] >= distance

    @graph.children(node)&.each do |child|
      if visited[child].nil?
        visited[child] = visited[node] + 1
        q << child
      end
    end
  end

  visited
end

# 入力受け取り
N, M = gets.split.map(&:to_i)
@graph = UndirectedGraph.new(N)
M.times { @graph.add_edge(*gets.split.map(&:to_i)) }
K = gets.to_i
DISTANCES = K.times.map { gets.split.map(&:to_i) }

@colors = Array.new(N + 1)
@need = {}

DISTANCES.each do |node, distance|
  @need[node] = []
  visited = search(node, distance)
  visited.each do |key, value|
    if value < distance
      @colors[key] = 0
    elsif value == distance
      @need[node] << key
    end
  end
end

1.upto(N) { |i| @colors[i] ||= 1 }

@need.each_value do |nodes|
  unless nodes.map { |i| @colors[i] }.include?(1)
    puts 'No'
    exit
  end
end

if @colors.include?(1)
  puts 'Yes'
  puts @colors[1..].join
else
  puts 'No'
end

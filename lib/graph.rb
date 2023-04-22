# frozen_string_literal: true

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

class DepthFirstSearch
  def initialize(graph)
    @graph = graph
    @results = []
  end

  def group
    @graph.each_node.group_by { |i| paint(i, i) }
  end

  private

  def paint(node, color)
    return @results[node] if @results[node]

    @results[node] = color

    @graph.children(node)&.each do |child|
      paint(child, color)
    end

    color
  end
end

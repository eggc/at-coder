class UndirectedGraph
  attr_reader :size

  def initialize(size)
    @size = size
    @edges = []
  end

  def add_edge(a, b)
    @edges[a] ||= []
    @edges[a] << b

    @edges[b] ||= []
    @edges[b] << a
  end

  def remove_edge(a, b)
    @edges[a].delete(b)
    @edges[b].delete(a)
  end

  def children(a)
    @edges[a]
  end

  def each_node(&block)
    (1..size).each(&block)
  end
end

class DepthFirstSearch
  def initialize(graph)
    @graph = graph
    @results = []
  end

  def paint_all
    @graph.each_node { |i| paint(i, i) }
    @results[1..]
  end

  def paint(node, color)
    return if @results[node]

    @results[node] = color

    @graph.children(node).each do |child|
      paint(child, color)
    end
  end
end

N, M = gets.split.map(&:to_i)
EDGES = M.times.map { gets.split.map(&:to_i) }

GRAPH = UndirectedGraph.new(N)
EDGES.each { |a, b| GRAPH.add_edge(a, b) }

@answer = 0

EDGES.each do |a, b|
  GRAPH.remove_edge(a, b)

  result = DepthFirstSearch.new(GRAPH).paint_all
  @answer += 1 if result.uniq.size == 2

  GRAPH.add_edge(a, b)
end

puts @answer

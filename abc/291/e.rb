require 'tsort'

class DirectedGraph
  include TSort

  attr_reader :size

  def initialize(size)
    @size = size
    @edges = []
  end

  def add_edge(a, b)
    @edges[a] ||= []
    @edges[a] << b
  end

  def each_node(&block)
    (1..size).each(&block)
  end

  def children(node)
    @edges[node]
  end

  def input_ranks
    ranks = Array.new(size + 1, 0)
    ranks[0] = nil

    each_node do |i|
      children(i)&.each { |j| ranks[j] += 1 }
    end

    ranks
  end

  def tsort
    stack = []
    answer = []
    ranks = input_ranks

    ranks.each_with_index do |rank, i|
      stack << i if rank == 0
    end

    while stack.size > 0
      if stack.size > 1
        puts 'No'
        exit
      end

      i = stack.pop
      answer << i
      children(i)&.each do |j|
        ranks[j] -= 1

        stack << j if ranks[j] == 0
      end
    end

    answer
  end
end

N, M = gets.split.map(&:to_i)
@graph = DirectedGraph.new(N)

M.times do
  a, b = gets.split.map(&:to_i)
  @graph.add_edge(a, b)
end

answer = []
sorted = @graph.tsort
sorted.each_with_index { |x, i| answer[x-1] = i+1 }

puts 'Yes'
puts answer.join(' ')

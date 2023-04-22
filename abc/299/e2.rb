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

  def distance(i, j)
    @distances ||= init_distances
    @distances[i][j]
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
    @edges[a]
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

  private

  def init_distances
    distances = Array.new(size + 1) { [] }

    each_node do |i|
      distances[i][i] = 0
      q = [i]

      until q.empty?
        j = q.pop

        children(j)&.each do |child|
          if distances[i][child].nil?
            distances[i][child] = distances[i][j] + 1
            q << child
          end
        end
      end
    end

    distances
  end
end

N, M = gets.split.map(&:to_i)
@graph = UndirectedGraph.new(N)
M.times { @graph.add_edge(*gets.split.map(&:to_i)) }
K = gets.to_i
DISTANCES = K.times.map { gets.split.map(&:to_i) }

@colors = Array.new(N + 1, nil)

# 白塗り
DISTANCES.each do |i, distance|
  @graph.each_node do |j|
    @colors[j] = 0 if @graph.distance(i, j) < distance
  end
end

# 残りを黒にする
1.upto(N) { |i| @colors[i] ||= 1 }

ok = true
ok = false unless @colors.include?(1)

# 条件をチェックする
DISTANCES.each do |i, distance|
  # 距離最小かつ黒
  k = @graph.each_node.min_by { |j| @colors[j] == 0 ? 9999 : @graph.distance(i, j) }
  ok = false unless @graph.distance(i, k) == distance
end

if ok
  puts 'Yes'
  puts @colors[1..].join
else
  puts 'No'
end

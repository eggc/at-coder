# frozen_string_literal: true

class UnionFind
  def initialize(size)
    @size = size
    @parents = []
  end

  def root(a)
    if @parents[a]
      @parents[a] = root(@parents[a])
    else
      a
    end
  end

  def union(a, b)
    root_a = root(a)
    root_b = root(b)

    return if root_a == root_b

    @parents[root_a] = root_b
  end

  def same?(a, b)
    root(a) == root(b)
  end

  def groups
    (1..@size).to_a.group_by { |i| root(i) }
  end
end

N, M = gets.split.map(&:to_i)
P = gets.split.map(&:to_i)

@union_find = UnionFind.new(N)

M.times.map do
  x, y = gets.chomp.split.map(&:to_i)
  @union_find.union(x, y)
end

puts (1..N).count { |i| @union_find.same?(i, P[i-1]) }

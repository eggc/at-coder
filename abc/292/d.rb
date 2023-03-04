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

  def same_group?(a, b)
    root(a) == root(b)
  end

  def groups
    (1..@size).group_by { |i| root(i) }
  end
end

N, M = gets.split.map(&:to_i)
@union_find = UnionFind.new(N)
@edges = Array.new(N+1, 0)

M.times do
  a, b = gets.split.map(&:to_i)
  @union_find.union(a, b)
  @edges[a] += 1
end

answer = @union_find.groups.all? do |_, nodes|
  nodes.size == nodes.sum { |node| @edges[node] }
end

puts(answer ? 'Yes' : 'No')

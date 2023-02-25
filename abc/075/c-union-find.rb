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
@edges = M.times.map { gets.split.map(&:to_i) }

puts(
  M.times.count do |i|
    @union_find = UnionFind.new(N)
    @edges.each_with_index do |(a, b), j|
      next if i == j

      @union_find.union(a, b)
    end

    !@union_find.same_group?(*@edges[i])
  end
)

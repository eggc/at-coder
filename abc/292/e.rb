require 'set'

N, M = gets.split.map(&:to_i)
@edges = {}
@memo = []
@answer = 0

M.times do
  a, b = gets.split.map(&:to_i)
  @edges[a] ||= []
  @edges[a] << b
end

def dfs(current)
  @edges[current]&.each do |next_node|
    if @memo[next_node].nil?
      @memo[next_node] = true
      dfs(next_node)
      @answer += 1
    end
  end
end

1.upto(N) do |i|
  @memo = []
  @memo[i] = true
  dfs(i)
end

puts(@answer - M)

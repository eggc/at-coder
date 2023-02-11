N, M = gets.split.map(&:to_i)
EDGES = {}

$stdin.each do |line|
  a, b = line.chomp.split.map(&:to_i)

  EDGES[a] ||= {}
  EDGES[a][b] = true
  EDGES[b] ||= {}
  EDGES[b][a] = true
end

VISITED = Array.new(N + 1)
VISITED[0] = true

@answer = 0

def dfs(n, prev)
  edges = EDGES[n]
  edges&.each do |x, value|
    if !value || x == prev
      next
    elsif VISITED[x]
      @answer += 1

      EDGES[n][x] = false
      EDGES[x][n] = false
    else
      VISITED[x] = true
      dfs(x, n)
    end
  end
end

1.upto(N) do |n|
  if !VISITED[n] && !EDGES[n]&.empty?
    VISITED[n] = true
    dfs(n, nil)
  end
end

puts @answer

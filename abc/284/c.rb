N, M = gets.split.map(&:to_i)
E = $stdin.map { |line| line.split(' ').map(&:to_i) }

EDGES = []

E.each do |u, v|
  EDGES[u] ||= []
  EDGES[u] << v

  EDGES[v] ||= []
  EDGES[v] << u
end

COLOR_MAP = Array.new(N+1)
COLOR_MAP[0] = -1

def search(node)
  EDGES[node]&.each do |child|
    unless COLOR_MAP[child]
      COLOR_MAP[child] = COLOR_MAP[node]
      search(child)
    end
  end
end

1.upto(N) do |i|
  if COLOR_MAP[i].nil?
    COLOR_MAP[i] = i
    search(i)
  end
end

puts(COLOR_MAP.uniq.size - 1)

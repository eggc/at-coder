require 'set'

def test
  n, m = gets.split.map(&:to_i)
  colors = gets.split.map(&:to_i)
  edges = {}

  m.times do
    u, v = gets.split.map(&:to_i)

    edges[u] ||= []
    edges[u] << v
    edges[v] ||= []
    edges[v] << u
  end

  puts bfs(edges, colors, n)
end

def bfs(edges, colors, goal)
  queue = [1]
  steps = { 1 => 0 }

  while !queue.empty?
    current = queue.shift

    if current == goal
      return steps[current]
    else
      edges[current].each do |nextn|
        if steps[nextn]
          next
        else
          steps[nextn] = steps[current] + 1
          queue << nextn
        end
      end
    end
  end

  -1
end

T = gets.to_i
T.times { test }

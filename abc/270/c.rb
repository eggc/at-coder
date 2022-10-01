# frozen_string_literal: true

N, X, Y = gets.chomp.split(' ').map(&:to_i)

EDGE_HASH = {}
(N - 1).times.each do
  u, v = gets.chomp.split(' ').map(&:to_i)

  EDGE_HASH[u] ||= []
  EDGE_HASH[u] << v

  EDGE_HASH[v] ||= []
  EDGE_HASH[v] << u
end

VISITED = []

def search(i)
  return if VISITED[i]

  VISITED[i] = true

  if i == Y
    [i]
  else
    EDGE_HASH[i]&.each do |target|
      result = search(target)

      if result
        result.unshift(i)
        return result
      end
    end

    nil
  end
end

puts search(X).join(' ')

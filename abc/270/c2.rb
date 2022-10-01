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

queue = [[X, nil]]
history = []
visited = []

while queue.length.positive?
  history << queue.first
  node = queue.shift[0]

  if node == Y

    answer = []

    loop do
      history.each do |current, prev|
        if current == node
          answer << node
          node = prev
          break
        end
      end

      if node == X
        answer << node
        break
      end
    end

    puts answer.reverse.join(' ')

    exit
  end

  visited[node] = true

  EDGE_HASH[node]&.each do |target|
    queue << [target, node] if visited[target].nil?
  end
end

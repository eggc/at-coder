# frozen_string_literal: true

N, M = gets.split.map(&:to_i)
E = $stdin.map { |line| line.split.map(&:to_i) }

@map = {}
@colors = {}

E.each do |u, v|
  @map[u] ||= {}
  @map[u][v] = true

  @map[v] ||= {}
  @map[v][u] = true
end

def paint(start_node, base_color)
  queue = [start_node]
  @colors[start_node] = base_color

  loop do
    break if queue.empty?

    node = queue.shift
    color = - @colors[node]

    @map[node]&.each do |child, _|
      if @colors[child].nil?
        @colors[child] = color
        queue << child
      elsif @colors[child] == color
        # 子の色が予定の色で彩色されてるなら OK
        next
      else
        # 子の色が予定してない色で彩色されてるならどう頑張っても2分グラフにはできない
        puts 0
        exit
      end
    end
  end
end

1.upto(N) do |node|
  next if @colors[node]

  paint(node, node)
end

chains = {}

@colors.each do |node, color|
  chains[color] ||= []
  chains[color] << node
end

answer = N * (N - 1) / 2
answer -= E.size

chains.keys.select { |c, _| c > 0 }.each do |color|
  c = chains[color].size
  d = chains[-color]&.size || 0

  answer -= c * (c - 1) / 2
  answer -= d * (d - 1) / 2
end

puts answer

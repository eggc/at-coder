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
    color = @colors[node] == base_color ? base_color + 1 : base_color

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
  next if @map[node].nil?

  paint(node, node)
end

answer = 0

1.upto(N) do |u|
  1.upto(N) do |v|
    next if u >= v
    next if @map.dig(u, v)

    # 辺を足したら2分グラフが成立しない
    next if @colors[u] == @colors[v] && !@colors[u].nil?

    answer += 1
  end
end

p answer

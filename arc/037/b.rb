# frozen_string_literal: true

N, M = gets.chomp.split(' ').map(&:to_i)
EDGES = M.times.map { gets.chomp.split(' ').map { |x| x.to_i - 1 } }
COLORS = Array.new(N)
LOOP = Array.new(N)

def paint(node, color, prev = nil)
  return LOOP[color] = true if COLORS[node]

  COLORS[node] = color
  EDGES.each do |n, m|
    paint(m, color, node) if n == node && m != prev
    paint(n, color, node) if m == node && n != prev
  end
end

N.times do |i|
  paint(i, i) if COLORS[i].nil?
end

puts(COLORS.uniq.count { |color| !LOOP[color] })

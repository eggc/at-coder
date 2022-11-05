# frozen_string_literal: true

S = $stdin.map { |line| line.chomp.split('') }

def length(a, b)
  (x2 - x1).abs + (y2 - y1).abs
end

def square?(corners)
  a, b, c, d = corners
  # 各点の距離を調べる
  l1 = length(a, b)
  l2 = length(b, c)
  l3 = length(c, d)
  l4 = length(d, a)


end

porns = []

9.times do |i|
  9.times do |j|
    if S[i][j] == '#'
      porns << [i,j]
    end
  end
end

answer = 0
porns.combination(4) do |corners|
  if squre?(corners)
    answer += 1
  end
end

p answer

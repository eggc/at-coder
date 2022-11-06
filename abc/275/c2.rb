# frozen_string_literal: true

S = $stdin.map { |line| line.chomp.split('') }

def length(a, b)
  x1, y1 = a
  x2, y2 = b
  (x2 - x1)**2 + (y2 - y1)**2
end

def square?(corners)
  a, b, c, d = corners
  # 各点の距離を調べる
  lengths = [
    length(a, b),
    length(b, c),
    length(c, d),
    length(d, a),
    length(a, c),
    length(b, d)
  ].sort

  lengths[0] == lengths[1] &&
    lengths[1] == lengths[2] &&
    lengths[2] == lengths[3] &&
    lengths[4] == lengths[5] &&
    lengths[0] * 2 == lengths[5]
end

def init_pawns
  pawns = []

  9.times do |i|
    9.times do |j|
      pawns << [i, j] if S[i][j] == '#'
    end
  end

  pawns
end

answer = 0
init_pawns.combination(4) do |corners|
  answer += 1 if square?(corners)
end

p answer

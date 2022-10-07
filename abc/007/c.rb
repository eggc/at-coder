# frozen_string_literal: true

R, C = gets.split.map(&:to_i)
sy, sx = gets.split.map(&:to_i)
gy, gx = gets.split.map(&:to_i)
c = $stdin.map { |x| x.split('') }

# 座標系を 0 基準に切り替える
sy -= 1
sx -= 1
gy -= 1
gx -= 1

queue = [[sy, sx, 0]]
steps = c.length.times.map { [] }
steps[sy][sx]

until queue.empty?
  y, x, step = queue.shift

  next if steps[y][x] || c[y][x] == '#'

  if x == gx && y == gy
    puts(step)
    exit
  else
    steps[y][x] = step

    queue.push(
      [y, x + 1, step + 1],
      [y, x - 1, step + 1],
      [y + 1, x, step + 1],
      [y - 1, x, step + 1]
    )
  end
end

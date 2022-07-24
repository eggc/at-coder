N, Y = gets.split(' ').map(&:to_i)


def solve(total_yen, x = 0, y = 0, z = 0)
  return if total_yen < 0
  return if x + y + z > N
  return [x, y, z] if total_yen == 0 && x + y + z == N

  solve(total_yen -  1000, x+1,   y,   z) ||
    solve(total_yen -  5000,   x, y+1,   z) ||
    solve(total_yen - 10000,   x,   y, z+1)
end

puts solve(Y).join(' ')

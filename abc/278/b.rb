H, M = gets.split.map(&:to_i)

now = [H, M]

loop do
  a, b = format("%02d", now[0]).chars
  c, d = format("%02d", now[1]).chars

  h = [a, c].join.to_i
  m = [b, d].join.to_i

  if 0 <= h && h <= 23 && 0 <= m && m <= 59
    puts now.join(' ')
    exit
  end

  if now[1] < 59
    now[1] += 1
  else
    if now[0] < 23
      now[0] += 1
      now[1] = 0
    else
      now[0] = 0
      now[1] = 0
    end
  end
end

AX, AY = gets.chomp.split(" ").map(&:to_i)
BX, BY = gets.chomp.split(" ").map(&:to_i)
CX, CY = gets.chomp.split(" ").map(&:to_i)
DX, DY = gets.chomp.split(" ").map(&:to_i)

def slope(x1,y1,x2,y2)
  (y2 - y1).to_f / (x2 - x1).to_f
end

def degree(x1, y1, x2, y2, x3, y3, x4, y4)
  m1 = slope(x1, y1, x2, y2)
  m2 = slope(x3, y3, x4, y4)

  puts([m1, m2])
  if m1 || 0 && m1 || Float::INFINITY
    90
  else
    Math.atan((m1 - m2)/(1 + m1 * m2))
  end
end

answer = degree(AX, AY, BX, BY, BX, BY, CX, CY)
answer = degree(BX, BY, CX, CY, CX, CY, DX, DY)

puts answer

N = gets.to_i
POSITIONS = [
  [0,0,0],
  *N.times.map { gets.split(" ").map(&:to_i) }
]

def can?(from, to)
  t0, x0, y0 = from
  t1, x1, y1 = to

  steps = t1 - t0
  min_steps = (x1-x0).abs + (y1-y0).abs

  (steps - min_steps) >= 0 && (steps - min_steps).even?
end

can_travel = POSITIONS.each_cons(2).all? { |from, to| can?(from, to) }

puts(can_travel ? 'Yes' : 'No')

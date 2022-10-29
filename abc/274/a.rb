A, B = gets.split.map(&:to_i)

rate = 1.0 * B / A
puts printf("%.3f", rate.round(3))

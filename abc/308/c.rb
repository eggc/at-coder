N = gets.to_i
P = N.times.map { gets.split.map(&:to_i) }

probs = P.map.with_index do |(a, b), index|
  [-Rational(a,(a + b)), index+1]
end

puts(probs.sort.map { |x| x[1] }.join(' '))

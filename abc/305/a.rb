N = gets.to_i

num = 0.upto(20).min_by do |i|
  (N - (i*5)).abs
end

puts(num * 5)

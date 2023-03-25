N = gets.to_i
A = gets.split.map(&:to_i)

puts A.select(&:even?).join(' ')

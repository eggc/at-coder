x, y = gets.split(' ').map(&:to_i)
result = (x * y).even? ? 'Even' : 'Odd'

puts(result)

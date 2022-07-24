count = 0
_size = gets
numbers = gets.split(' ').map(&:to_i)

loop do
  if numbers.all?(&:even?)
    numbers = numbers.map { |x| x / 2 }
    count += 1
  else
    break
  end
end

puts(count)

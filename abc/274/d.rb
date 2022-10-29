N, x, y = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

x_current = A[0]
x_buckets = Array.new(11, 0)
y_current = 0
y_buckets = Array.new(11, 0)

(1...N).each do |i|
  if i.even?
    x_current += A[i]
    x_buckets[A[i]] += 1
  else
    y_current += A[i]
    y_buckets[A[i]] += 1
  end
end

indexes = (1..10).to_a.reverse

while x_current > x do
  diff = x_current - x

  target = indexes.find do |i|
    diff >= 2*i && x_buckets[i] > 0
  end

  break if target.nil?

  x_buckets[target] -= 1
  x_current -= target * 2
end

while y_current > y do
  diff = y_current - y

  target = indexes.find do |i|
    diff >= 2*i && y_buckets[i] > 0
  end

  break if target.nil?

  y_buckets[target] -= 1
  y_current -= target * 2
end

if x_current == x && y_current == y
  puts 'Yes'
else
  puts 'No'
end

p x_buckets
p [x_current, y_current]

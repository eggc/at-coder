N = gets.to_i
H = gets.split.map(&:to_i)

max = 0
answer = 0

H.each_with_index do |h, i|
  if h > max
    answer = i
    max = h
  end
end

puts answer + 1

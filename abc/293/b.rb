N = gets.to_i
A = gets.split.map(&:to_i)

called = Array.new(N+1)

1.upto(N).each do |i|
  if called[i].nil?
    called[A[i-1]] = true
  end
end

answer = []

1.upto(N).each do |i|
  if called[i].nil?
    answer << i
  end
end

puts answer.count
puts answer.join(' ')

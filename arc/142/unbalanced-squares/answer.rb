N = gets.to_i

answer = []
current = 1

N.times do |i|
  answer[i] = []
  if i.even?
    N.times do |j|
      answer[i][j] = current
      current += 1
    end
  end
end

N.times do |i|
  if i.odd?
    N.times do |j|
      answer[i][j] = current
      current += 1
    end
  end
end

answer.each do |row|
  puts row.join(" ")
end

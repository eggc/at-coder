A = gets.to_i
B = gets.to_i
C = gets.to_i
X = gets.to_i

count = 0

(A + 1).times do |a|
  (B + 1).times do |b|
    (C + 1).times do |c|
      sum = a * 500 + b * 100 + c * 50
      if sum == X
        count += 1
      end
    end
  end
end

puts(count)

# frozen_string_literal: true
# 累積和の効率的な計算手法

N = gets.to_i
A = gets.split.map(&:to_i)
Q = gets.to_i
Q_RANGES = Q.times.map { gets.split.map(&:to_i) }

@sum_hit = [0]
@sum_miss = [0]

N.times do |i|
  if A[i] > 0
    @sum_hit[i + 1] = @sum_hit[i] + 1
    @sum_miss[i + 1] = @sum_miss[i]
  else
    @sum_hit[i + 1] = @sum_hit[i]
    @sum_miss[i + 1] = @sum_miss[i] + 1
  end
end

Q_RANGES.each do |left, right|
  left -= 1

  hit = @sum_hit[right] - @sum_hit[left]
  miss = @sum_miss[right] - @sum_miss[left]

  if hit == miss
    puts 'draw'
  elsif hit > miss
    puts 'win'
  else
    puts 'lose'
  end
end

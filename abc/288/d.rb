# frozen_string_literal: true

N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
Q = gets.to_i

gsum = Array.new(K) { [0] }

K.times do |k|
  N.times do |i|
    gsum[k][i + 1] =
      if i % K == k
        gsum[k][i] + A[i]
      else
        gsum[k][i]
      end
  end
end

Q.times do
  left, right = gets.split.map(&:to_i)
  left -= 1
  total = gsum[0][right] - gsum[0][left]

  if K.times.all? { |k| total == gsum[k][right] - gsum[k][left] }
    puts 'Yes'
  else
    puts 'No'
  end
end

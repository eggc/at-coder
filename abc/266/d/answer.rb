N = gets.to_i
T = []
X = []
A = []
MEMO = { 0 => [0, nil, nil, nil, nil] }

N.times do |i|
  T[i], X[i], A[i] = gets.chomp.split(" ").map(&:to_i)
end

i = 1

N.times do |n|
  # 時刻 i でポジション k にいるときの最大値を計算
  loop do
    MEMO[i] = []

    5.times do |k|
      prev_max = if k == 0
                   [MEMO[i-1][k], MEMO[i-1][k+1]].compact.max
                 elsif k == 4
                   [MEMO[i-1][k-1], MEMO[i-1][k]].compact.max
                 else
                   [MEMO[i-1][k-1], MEMO[i-1][k], MEMO[i-1][k+1]].compact.max
                 end

      if !prev_max
        next
      elsif T[n] == i && X[n] == k
        MEMO[i][k] = prev_max + A[n]
      else
        MEMO[i][k] = prev_max
      end
    end

    i += 1

    break if i > T[n]
  end
end

# 最後のスコアをみる
puts MEMO[T.last || 0].compact.max

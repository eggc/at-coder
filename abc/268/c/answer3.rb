N = gets.to_i
P = gets.chomp.split(" ").map(&:to_i)

# 料理がマッチする人は三人しかいないので
# 料理1個についてマッチする人の場所に届ける方法を計算する
# そうすると 3 * N 回のループで終わるから速いはず
# 同じ計算もあるのでメモ化しといたほうが良い

# 先に配るべき人を明らかにしておく
TARGETS = []
N.times do |i|
  TARGETS[i] = [
    (P[i] - 1) % N,
    P[i],
    (P[i] + 1) % N
  ]
end


# 料理 i を target 3人に届く回し方を探索
ROUNDS = {}
N.times do |i|
  TARGETS[i].each do |j|
    ROUNDS[j] = 0
  end
end

max_value = 0

ROUNDS.each do |round, _value|
  value = 0

  N.times do |i|
    receiver = (i + round) % N

    a,b,c = TARGETS[i]

    if receiver == a ||
       receiver == b ||
       receiver == c
      value += 1
    end
  end

  if max_value < value
    max_value = value
  end
end

puts max_value

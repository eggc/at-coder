N = gets.to_i
P = gets.chomp.split(" ").map(&:to_i)


# 料理がマッチする人は三人しかいないので
# 料理1個についてマッチする人の場所に届ける方法を計算する
# そうすると 3 * N 回のループで終わるから速いはず
# 同じ計算もあるのでメモ化しといたほうが良い

results = {}

# 料理 i を target 3人に届く場合を探索
N.times do |i|

  # 位置 i にある料理を P[i] に届けるために回転させる回数
  round = (P[i] - i) % N

  results[(round - 1) % N] = 0
  results[round] = 0
  results[(round + 1) % N] = 0
end

max_value = 0

results.each do |key, _value|

  value = 0

  # key 回まわす
  N.times do |i|
    receiver = (i + key) % N

    if P[i] == (receiver - 1) % N ||
       P[i] == receiver ||
       P[i] == (receiver + 1) % N
      value += 1
    end
  end

  if max_value < value
    max_value = value
  end
end

puts max_value

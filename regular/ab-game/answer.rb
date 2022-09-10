N, A, B = gets.split(' ').map(&:to_i)

if A == 1
  puts(N)
  exit
end

# そもそもどうやっても勝てない
if N < A
  puts(0)
  exit
end

if A + B >= 2 * A
  # 最初の A - 1 試合以外は全部勝つ
  puts(N - A + 1)
  exit
end

# 1 ... A-1 ゲームまでは敗北
current = 0

# 割り切れる場合
if N % A == 0
  current += (N/A) * B
  puts(current)
  exit
end

# 割り切れない場合は一個前の周期まで計算
K = (N/A).floor
current += (K-1) * B

# 残りの試合
# (K*N) から (K*N)+B-1 までは勝つ(B個)
if (K*A)+B-1 < N
  current += B
else
  current += N - A*K + 1
end

puts(current)

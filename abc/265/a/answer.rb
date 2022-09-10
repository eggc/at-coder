X, Y, N = gets.chomp.split(" ").map(&:to_i)

current = 0
total_yen = 0

# まとめ買いのほうが安いならなるべくまとめ買いする
if X > Y/3
  current += (N / 3) * 3
  total_yen += (N / 3) * Y
end

# 残りを X で買う
total_yen += (N - current) * X

puts(total_yen)

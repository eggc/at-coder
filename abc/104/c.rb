# frozen_string_literal: true

D, G = gets.chomp.split(' ').map(&:to_i)
DATA = D.times.map { gets.chomp.split(' ').map(&:to_i) }
P = DATA.map(&:first)
C = DATA.map(&:last)

answer = 1000

[true, false].repeated_permutation(D).each do |flags|
  problem_count = 0
  total_score = 0

  flags.each_with_index do |flag, i|
    next unless flag

    # コンプリートボーナスを取りに行く
    total_score += C[i] + P[i] * (i + 1) * 100
    problem_count += P[i]
  end

  # コンプリートボーナスで足りないなら補充する
  if total_score < G
    # コンプリートボーナスでない問題グループのうち高得点のものを探す
    i = flags.rindex(&:!)

    # 解くべき問題の数を計算する
    diff = ((G - total_score) / ((i + 1) * 100.0)).ceil

    next if diff > P[i]

    problem_count += diff
  end

  answer = [answer, problem_count].min
end

puts(answer)

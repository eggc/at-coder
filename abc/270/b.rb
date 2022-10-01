# frozen_string_literal: true

X, Y, Z = gets.chomp.split(' ').map(&:to_i)

# 0 = スタート地点
# X = ゴール
# Y = 壁
# Z = ハンマー

# ゴールの前に壁がある上、ハンマーは壁の後ろにある
if (Y.positive? && Y < X && Y < Z) || (Y.negative? && Y > X && Y > Z)
  puts(-1)
elsif (Y.positive? && Y < X) || (Y.negative? && Y > X)
  # ハンマーへ移動したあとゴールへ移動（途中で壁破壊）
  puts Z.abs + (X - Z).abs
else
  # 壁を突破する必要がない
  puts X.abs
end

# frozen_string_literal: true

T = gets.to_i
T.times do
  # 標準入力を捨てる
  gets

  array = gets.split.map(&:to_i)
  puts array.count(&:odd?)
end

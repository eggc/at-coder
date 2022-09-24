# frozen_string_literal: true

N = gets.to_i
t = N.times.map { gets.to_i }

# 肉を肉焼きセットA,B のどちらで焼くかをすべて割り振ってみる
puts([true, false].repeated_permutation(N).map do |flags|
  a = 0
  b = 0

  flags.each_with_index do |flag, i|
    if flag
      a += t[i]
    else
      b += t[i]
    end
  end

  [a, b].max
end.min)

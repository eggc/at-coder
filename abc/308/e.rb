# frozen_string_literal: true

N = gets.to_i
A = gets.split.map(&:to_i)
S = gets.chomp.chars

XS = {
  [0, 0] => [],
  [0, 1] => [],
  [0, 2] => [],
  [1, 1] => [],
  [1, 2] => [],
  [2, 2] => []
}.freeze

XS[[0, 0]][N] = 0
XS[[0, 1]][N] = 0
XS[[0, 2]][N] = 0
XS[[1, 1]][N] = 0
XS[[1, 2]][N] = 0
XS[[2, 2]][N] = 0

(N - 1).downto(0) do |k|
  if S[k] == 'X'
    case A[k]
    when 0
      XS[[0, 0]][k] = XS[[0, 0]][k + 1] + 1
      XS[[0, 1]][k] = XS[[0, 1]][k + 1] + 2
      XS[[0, 2]][k] = XS[[0, 2]][k + 1] + 1
      XS[[1, 1]][k] = XS[[1, 1]][k + 1] + 2
      XS[[1, 2]][k] = XS[[1, 2]][k + 1] + 3
      XS[[2, 2]][k] = XS[[2, 2]][k + 1] + 1
    when 1
      XS[[0, 0]][k] = XS[[0, 0]][k + 1] + 2
      XS[[0, 1]][k] = XS[[0, 1]][k + 1] + 2
      XS[[0, 2]][k] = XS[[0, 2]][k + 1] + 3
      XS[[1, 1]][k] = XS[[1, 1]][k + 1]
      XS[[1, 2]][k] = XS[[1, 2]][k + 1]
      XS[[2, 2]][k] = XS[[2, 2]][k + 1]
    when 2
      XS[[0, 0]][k] = XS[[0, 0]][k + 1]
      XS[[0, 1]][k] = XS[[0, 1]][k + 1] + 3
      XS[[0, 2]][k] = XS[[0, 2]][k + 1] + 1
      XS[[1, 1]][k] = XS[[1, 1]][k + 1]
      XS[[1, 2]][k] = XS[[1, 2]][k + 1]
      XS[[2, 2]][k] = XS[[2, 2]][k + 1]
    end
  else
    XS[[0, 0]][k] = XS[[0, 0]][k + 1]
    XS[[0, 1]][k] = XS[[0, 1]][k + 1]
    XS[[0, 2]][k] = XS[[0, 2]][k + 1]
    XS[[1, 1]][k] = XS[[1, 1]][k + 1]
    XS[[1, 2]][k] = XS[[1, 2]][k + 1]
    XS[[2, 2]][k] = XS[[2, 2]][k + 1]
  end
end

ans = 0

N.times do |i|
  next if S[i] != 'M'

  (i + 1).upto(N) do |j|
    next if S[j] != 'E'

    ans += XS[A.values_at(i, j).sort][j+1]
  end
end

puts ans

require 'set'

N = gets.to_i
LIST = N.times.map { gets.chomp.split(' ').map(&:to_i) }

# 6角形グリッドのあるマス (x, y) から到達可能なのは
# 左上 (x+1, y)
# 右上 (x+1, y+1)
# 右   (x+1, y)
# 右下 (x,   y-1)
# 左下 (x-1, y-1)
# 左   (x-1, y)
# なので、与えられた２つのマスが連結成分かどうかは判定可能

# 複数のマスが与えられたときそれらを連結成分に分解するのはどうやるのか？
# まず 3つのマスがくっついている LIST の場合
# LIST からマスを一個取り出して answer に入れる。
# そしてそのマスから探索領域 queue に 6 個の隣接マスを加える
# LIST と queue の共通部分をとって、見つかったものを LIST から取り除き answer に入れる
# answer の探索領域を queue に加える。このときすでに探索済みの領域は入れなくていい。
# そうすると計算量はどうなるかというと O(n) だから意外と探索できるのかもしれない。
# いや、でも共通部分を取るところで n^2 かかるとしたら n^3 になってしまう。
# Set にしとけば高速になるとは思う。できそうな気はする。

# いや、でもこれくっついてるなら全部の連結数を何度も計算する事になってしまうのでは。
# 計算済みラベルがあればいいのかな？ もうすでに採用したよ的な
# うーん難しすぎる。良くない気がしてきた。到達済みマスを渡す再帰計算でもいい気がしてきた。

def neighbors(args)
  x, y = args

  [
    [x + 1, y],
    [x + 1, y + 1],
    [x + 1, y],
    [x, y - 1],
    [x - 1, y - 1],
    [x - 1, y]
  ]
end

def solve(current_step, target, moved = Set.new)
  next_steps = (target & neighbors(current_step).to_set) - moved
  next_step = next_steps.first

  if next_step
    next_moved = moved.dup
    next_moved << current_step

    solve(next_steps.first, target, next_moved)
  else
    moved
  end
end

target = LIST.to_set

puts(LIST.group_by { |current_step| solve(current_step, target) }.count)

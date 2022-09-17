N = gets.chomp.to_i

# N の 2 進数
binary = N.to_s(2)

# binary の 1 が立っているところは 0 に変えてもいいという 2択で全組み合わせをやる
# まず 0 から初めてカウントアップしていって、許されてる値なら採用する
# で行こうかと思ったけど 2^60 はカウントアップできないので全探索は不可能
# 解の領域だけを探索してソートするというのが良さそう。

# [1,0], [1,0], [0], [1,0] みたいな組み合わせを探索するのはどうやるんだ
# 再帰でやってみるか

def solve(binary)
  return [''] if binary.empty?

  rest = binary[0...-1]
  last = binary[-1]

  if last == '0'
    solve(rest).map { |x| "#{x}0" }
  else
    solve(rest).flat_map { |x| ["#{x}1", "#{x}0"] }
  end
end

answer = solve(binary).map { |x| x.to_i(2) }.sort

puts answer

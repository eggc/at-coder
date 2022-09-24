# frozen_string_literal: true

S = gets.chomp.chars

# 全探索せよという問題。
# 文字の隙間に + を入れるかどうかの二択を発生させる。
# S はたかだか10文字なのでその隙間は9箇所。
# よって 2^9 通りの選択肢があるということだ。
# 計算自体は eval を使えば可能だと思う。

def pattern(chars)
  return [chars] if chars.length == 1

  # 最後の文字以外を計算
  patterns = pattern(chars[0..-2])
  patterns.flat_map do |pat|
    [
      pat.dup.insert(-1, chars.last),
      pat.dup.insert(-1, '+', chars.last)
    ]
  end
end

answer = pattern(S).sum { |chars| eval(chars.join) }

puts(answer)

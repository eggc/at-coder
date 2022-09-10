https://atcoder.jp/contests/arc145/tasks/arc145_a

# 問題文
A, B からなる長さ N の文字列 S が与えられます。

あなたは、以下の操作を 0 回以上好きな回数繰り返すことができます。

S の中の隣接する 2 文字を一ヶ所選び、AB で置き換える。
S を回文にできるか判定してください。

2≤N≤2×10^5

S は A, B からなる長さ N の文字列

# 案

素直に計算するのはかなり難しい。

S の中の 2文字を AB にできるということはほぼ全ての文字が置き換え可能ということになる。
たとえば BAで始まる文字は BAAAAAA...AAAAAAB に置き換えればいいので計算するまでもなく S は回文にできる。

- A で始まる文字の場合 A で終わってれば回文にできる。
  - たとえば
  - AXXA
  - ABXA
  - AABA
  - ABBA
  - AXXXA も同じ
  - AXXXXA
  - ABXXAA
  - AABXAA
  - AAABAA
  - AAAABA
  - ABAABA で回文完成
  - AAXXXAA の場合 これも同じ考え方でいける
- A で始まって B で終わる文字は回文にできない。
  - AXXB
- B で始まる文字の場合 A で終わってれば回文にできる。（ただし2文字のときはダメ）
  - なぜなら
  - BXXA
  - ABXA
  - AABA
  - ABBA
- B で始まって B で終わる場合。
  - BB なら OK
  - BXB なら OK
  - BXXB なら
  - BABB
  - BAAB OK
  - BXXXB でも同じことがいえる

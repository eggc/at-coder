https://atcoder.jp/contests/abc263/tasks/abc263_b

# 問題文
N 人の人がいます。N 人の人には人1, 人2,…, 人N と番号がついています。

人 i(2≤i≤N) の親は人 Pi です。ここで、Pi <i が保証されます。

人 1 が人 N の何代前か求めてください。

# 制約

2≤N≤50
1≤Pi<i(2≤i≤N)

入力は全て整数。

# 案


1,2,3,4,5,6,7,8...,N という人がいるとする。
このとき P2, P3, ... PN がヒントとして与えられる。
1 が最も古い世代であり N が最も若い世代である。

たとえば 8 の親は P8 と書く。P8 < 8 を満たす。

PN から遡っていけばよいだけ。
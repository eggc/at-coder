https://atcoder.jp/contests/abs/tasks/abc083_b

問題文: 1 以上 N 以下の整数のうち、10 進法での各桁の和が A 以上 B 以下であるものの総和を求めてください。

1 ≦ n ≦ N ≦ 1000 として n を文字列に変換する。そしてその文字列を分解した上で整数に変換して総和をもとめることで n の桁の和 summary(n) は計算できる。ただ答えは A ≦ summary(n) ≦ B であるような n の和を期待されている。線形探索するだけでよさそう。

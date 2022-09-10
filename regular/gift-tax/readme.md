https://atcoder.jp/contests/arc144/tasks/arc144_b

# 問題文
a≤b を満たす正整数 a,b および，正整数列 A=(A1, A2,…,AN) が与えられます．
あなたはこの数列に対して，以下の操作を何度でも行うことができます（0 回でもよいです）
  相異なる添字 i,j (1≤i,j≤N) を選ぶ．Ai に a を加え，Aj から b を引く．

操作後の min(A1 ,A2 ,…,AN) としてありうる最大値を求めてください．

# 案

問題が言っていることを整理

- A は正の整数でできた配列だと思うことにする
- 適当な要素を2個選んで、a を足して b を引ける（これは何回やっても良い）
  - a ≦ b なので、総和が増加することはありえない
- そして最後に配列の最小値を取り出した時に、最大になるようにせよ
- イメージ的には高い数値を潰して低い数値を引き上げていけばよさそうである

- 加算因子 a 減算因子 b という感じ

- 最大値を減算の対象にして、最小値を加算の対象にするというのは基本戦略
- ただ、操作を何回適用するべきかはよくわからない
- 基本的に移動させるほど総和は減っていくので、余計な移動はさせない方が良い

- 最小値が小さくなってしまうような操作は NG
- 最小値が大きくなる操作なら何回しても良い？
  - なぜなら何処かからもらわないと最小値を加算できないからどこからもらっても一緒・・・とはいえないか
  - 最大値から最小値へのプレゼントをするのは確定で良い操作
  - 最大値の座を失う場合にはプレゼントしないほうが良いことが多い、が最大値を脱落しても最小値を伸ばす方が良いこともある
    - 最大値が最小値になってしまう時でも、渡した方が良いことはあり得る
    - 例： A = [100, 110] がある時に a = 5, b = 6 なら操作した方が良い

- 整数の長さは最大で3万もあるので毎回最大とか最小を計算するのはしんどいと思われる
- なんとかシミュレーションせずに最大値だけを計算できないか
- 和と平均値とかを使ってうまくやれないか

たとえば一個の値を動かした時平均値はどう変動するのか？

変更前の平均値 = (A1 + A2 + ... + AN) / N
変更後の平均値 = (A1 + A2 + ... + AN + A - B) / N

- 最小値、平均値を超えることはない

うーん無理そう。とりあえず素直にループ回したらどうなるんだ。
最初の実装は時間オーバーで失敗する。

# 改善案

毎回最小と最大を見つけるのが辛いので値を移動させた後ソート状態を保つために頑張ってみる
あと、まとめて操作することを考える
最小値が最小値でなくなるまでやる OR 最大値が最大値でなくなるまでやる
それだけだと不十分で最大値がすごく大きくて他のやつが小さい時にうまく機能しない・・・
同じことの繰り返しだから最適化できそうな気はするのだが不可逆なところが難しい

やっぱ操作しながら計算するんじゃなくて、答えを一足飛びに出す方法があるんじゃないか
たとえば加算と減算は順序を入れ替えてもよいから減算だけ減算プールというところに貯めとくとか

減算プールに貯めてる状態で最小値をばんばん足していく
減算プールにどれくらい溜まったら終わりなのかというと
(総和 + 減算プール)/N が 最小値になりそうだったらやめるとかダメだわからない。
最終状態を観察すると「ほぼ平ら」な感じになっている。

# 模範解答

とりあえず答えが C であると仮定しよう。
このとき A1, A2, A3, ... AN に対して下記のように Xi と Yi を決める。

- Ai < C なら Xi 回の加算を行う
- Ai ≧ C なら Yi 回の減算を行う

そのときに X1 + X2 + X3 ... + XN ≦ Y1 + Y2 + Y3 ... + YN となっているなら C は達成可能。
適当な C を設定して、達成可能ならより大きな C を選択する、
達成不可能ならより小さな C を選択するということを繰り返していけば二分探索により最大の C が求められる。
A の最小値 ≦ C ≦ A の最大値を満たすので、C の探索領域はそれほど広くはない。
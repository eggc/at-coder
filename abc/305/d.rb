# frozen_string_literal: true

N = gets.to_i
A = gets.split.map(&:to_i)
Q = gets.to_i

QUERIES = Q.times.map { gets.split.map(&:to_i) }

sums = [0]

N.times do |i|
  sums[i + 1] = if i.even?
                  # 起きてる区間なので加算なし
                  sums[i]
                else
                  # 次に起きるまでの睡眠時間を加算
                  sums[i] + (A[i + 1] - A[i])
                end
end

QUERIES.each do |head, tail|
  i = A.bsearch_index { |x| x >= head }
  j = A.bsearch_index { |x| x >= tail }

  sum = sums[j] - sums[i]
  head_extra = (head != A[i] && i.even?) ? A[i] - head : 0
  tail_extra = (tail != A[j] && j.even?) ? A[j] - tail : 0

  # pp [A[i], A[j], sum, head_extra, tail_extra]
  puts(sum + head_extra - tail_extra)
end

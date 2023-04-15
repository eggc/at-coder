# frozen_string_literal: true

MOD = 998_244_353
Q = gets.to_i
queries = Q.times.map { gets.split(' ').map(&:to_i) }

S = [1]
ans = 1

queries.each do |q, x|
  case q
  when 1
    S << x
    ans = (ans * 10 + x) % MOD
  when 2
    head = S.shift
    ans -= (head * 10.pow(S.length, MOD))
  when 3
    puts ans % MOD
  end
end

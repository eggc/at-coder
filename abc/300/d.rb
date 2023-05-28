# frozen_string_literal: true

require 'prime'

N = gets.to_i
MAX = 300_000
primes = Prime.each(MAX).to_a
P = primes.size

answer = 0

P.times do |i|
  a = primes[i]

  break if a**5 > N

  (i + 1).upto(P) do |j|
    b = primes[j]

    break if a * a * b * b * b > N

    c = Math.sqrt(N / (a * a * b).to_f).floor

    k = primes.bsearch_index { |x| x >= c }

    if k && k - j > 0
      p [a, b, primes[k]]
      answer += k - j
    end
  end
end

p answer
# 2817785

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

    (j + 1).upto(P) do |k|
      c = primes[k]

      break if a * a * b * c * c > N

      answer += 1
    end
  end
end

p answer

# frozen_string_literal: true

require 'prime'

K = gets.to_i

def legendre(num, prime)
  if num < 2
    0
  else
    (num / prime) + legendre(num / prime, prime)
  end
end

primes = K.prime_division

answer = (2..K).bsearch do |n|
  primes.all? do |prime, count|
    legendre(n, prime) >= count
  end
end

puts answer

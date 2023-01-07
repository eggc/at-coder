# frozen_string_literal: true

require 'prime'

PRIMES = Prime.each(2_080_083).to_a

T = gets.to_i
N = $stdin.map(&:to_i)

def divide(n)
  PRIMES.each do |prime|
    if n % prime == 0
      if (n / prime) % prime == 0
        return [
          prime,
          n / prime / prime
        ]
      else
        return [
          Math.sqrt(n / prime).to_i,
          prime
        ]
      end
    end
  end
end

N.each do |n|
  puts(divide(n).join(' '))
end

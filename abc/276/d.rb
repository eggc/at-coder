# frozen_string_literal: true

require 'prime'

N = gets.to_i
A = gets.split.map(&:to_i)

class Array
  def lcm
    inject(:lcm)
  end

  def gcd
    inject(:gcd)
  end
end

gcd = A.gcd

N.times do |i|
  A[i] = A[i] / gcd
end

answer = 0

A.each do |ai|
  factors = ai.prime_division
  factors.each do |base, pow|
    if [2, 3].include?(base)
      answer += pow
    else
      puts(-1)
      exit
    end
  end
end

puts answer

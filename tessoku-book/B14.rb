# frozen_string_literal: true

require 'set'

N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

def build(array)
  n = array.size
  result = Set.new

  (2**n).times do |flag|
    sum = 0

    n.times do |i|
      sum += array[i] if flag[i] == 1
    end

    result << sum if sum <= K
  end

  result
end

@a = build(A[0, N / 2])
@b = build(A[N / 2, N])

@a.each do |a|
  @b.each do |b|
    if a + b == K
      puts 'Yes'
      exit
    end
  end
end

puts 'No'

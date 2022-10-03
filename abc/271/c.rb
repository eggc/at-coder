# frozen_string_literal: true

require 'set'

N = gets.to_i
A = gets.split.map(&:to_i)

tally = A.tally
stock = tally.values.sum - tally.size # ダブリの数

A.sort!
A.uniq!

# 本棚
backet = {}
A.each { |a| backet[a] = true }

current = 0
(1..N).each do |i|
  # すでに持ってる
  if backet[i]
    current = i
    next
  # ダブリを売却
  elsif stock >= 2
    current = i
    stock -= 2
  # ダブリとダブリ以外の組み合わせで売却
  elsif stock >= 1 && A.size >= 1 && A[-1] > i
    current = i
    stock -= 1
    A.pop(1)
  # ダブリ以外を売って入手可能なら入手
  elsif A.size >= 2 && A[-1] > i && A[-2] > i
    current = i
    A.pop(2)
  else
    # どのように売却しても入手できないので終わり
    break
  end
end

puts(current)

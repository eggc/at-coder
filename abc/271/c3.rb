# frozen_string_literal: true

require 'set'

N = gets.to_i
A = gets.split.map(&:to_i)
A.sort!

def log(answer, buy, leave, sale)
  print("Try to complete 1..#{answer}")
  puts(buy.length <= sale.length / 2 ? ' ... SUCCESS' : ' ... FAIL')
  puts("leave: #{leave}")
  puts("sale: #{sale.join(', ')}")
  puts("buy: #{buy}")
end

def check(answer)
  sale = []
  leave = Set.new

  A.each do |x|
    if answer < x || leave.include?(x)
      sale << x
    else
      leave << x
    end
  end

  buy = Set.new(1..answer) - leave

  # log(answer, buy, leave, sale)

  buy.length <= sale.length / 2
end

# check を満たさない最小値を探索
result = (1..N + 1).bsearch { |x| !check(x) } || 1

# 解答は check を満たす最大値
puts(result - 1)

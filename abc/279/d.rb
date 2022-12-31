# frozen_string_literal: true

require 'bigdecimal'

A, B = gets.split.map(&:to_i)
K = (A.to_f / (2 * B))**(2.0 / 3.0) - 1

if K <= 0
  puts A
else
  range = [K.floor, K.ceil]

  values = range.map do |k|
    (k * B) + A / Math.sqrt(k + 1)
  end

  puts values.min.to_s
end

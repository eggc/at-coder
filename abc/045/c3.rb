# frozen_string_literal: true

S = gets.chomp.chars

answer = [true, false].repeated_permutation(S.length - 1).sum do |flags|
  chars = []

  S.each_with_index do |char, i|
    chars << char
    chars << '+' if flags[i]
  end

  eval(chars.join)
end

puts(answer)

# frozen_string_literal: true

A, B, C, D = gets.chomp.chars.map(&:to_i)

['+', '-'].repeated_permutation(3).each do |op|
  syntax = [A, op[0], B, op[1], C, op[2], D].join

  if eval(syntax) == 7
    puts "#{syntax}=7"
    exit
  end
end

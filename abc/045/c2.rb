# frozen_string_literal: true

S = gets.chomp.chars

answer = 0

last_flag = 2**(S.length - 1)
last_flag.times do |flags|
  chars = []

  S.length.times do |i|
    chars << S[i]
    chars << '+' if flags[i] == 1
  end

  answer += eval(chars.join)
end

puts(answer)

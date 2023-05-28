# frozen_string_literal: true

N = gets.to_i
S = gets.chomp
T = gets.chomp

ok = true

N.times do |i|
  next if S[i] == T[i] ||
          S[i] == '1' && T[i] == 'l' ||
          S[i] == 'l' && T[i] == '1' ||
          S[i] == '0' && T[i] == 'o' ||
          S[i] == 'o' && T[i] == '0'

  ok = false
end

if ok
  puts 'Yes'
else
  puts 'No'
end

# frozen_string_literal: true

H, W = gets.split.map(&:to_i)
S = Array.new(H) { gets.chomp.chars.map { |s| s == '.' ? 1 : 2 } }.transpose
T = Array.new(H) { gets.chomp.chars.map { |s| s == '.' ? 1 : 2 } }.transpose

strans = S.sort
ttrans = T.sort

p strans
p ttrans

if W.times.all? { |i| strans[i] == ttrans[i] }
  puts 'Yes'
else
  puts 'No'
end

# frozen_string_literal: true

N = gets.to_i
S = $stdin.map(&:chomp)

HEAD = %w[H D C S].freeze
TAIL = %w[A 2 3 4 5 6 7 8 9 T J Q K].freeze

unless S.all? { |s| HEAD.include? s[0] }
  puts 'No'
  exit
end

unless S.all? { |s| TAIL.include? s[1] }
  puts 'No'
  exit
end

if S.size != S.uniq.size
  puts 'No'
  exit
end

puts 'Yes'

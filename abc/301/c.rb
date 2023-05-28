# frozen_string_literal: true

S = gets.chomp.chars
T = gets.chomp.chars
REPLACEABLE = %w[a t c o d e r].freeze

result = {}
wild_s = 0
wild_t = 0

S.length.times do |i|
  if S[i] == '@'
    wild_s += 1
  else
    result[S[i]] ||= 0
    result[S[i]] += 1
  end

  if T[i] == '@'
    wild_t += 1
  else
    result[T[i]] ||= 0
    result[T[i]] -= 1
  end
end

result.each do |key, value|
  if REPLACEABLE.include?(key)
    if value > 0
      # S に余分に出てくる
      wild_t -= value
    elsif value < 0
      # T に余分に出てくる
      wild_s += value
    end
  elsif value != 0
    wild_t = -1
    wild_s = -1
  end
end

if wild_t >= 0 && wild_s >= 0
  puts 'Yes'
else
  puts 'No'
end

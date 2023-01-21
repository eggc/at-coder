# frozen_string_literal: true

N = gets.to_i
S = gets.chomp.chars

def find(diff)
  N.times do |i|
    return i if S[i + diff].nil?
    return i if S[i] == S[i + diff]
  end

  N - 1
end

1.upto(N - 1) do |i|
  p find(i)
end

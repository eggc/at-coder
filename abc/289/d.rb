# frozen_string_literal: true

require 'set'

N = gets.to_i
A = gets.split.map(&:to_i)
M = gets.to_i
B = gets.split.map(&:to_i)
X = gets.to_i

@visited = B.to_set

def dfs(current)
  if current == X
    true
  elsif current > X
    false
  else
    A.any? do |a|
      if @visited.include?(current + a)
        false
      else
        @visited << current + a
        dfs(current + a)
      end
    end
  end
end

puts dfs(0) ? 'Yes' : 'No'

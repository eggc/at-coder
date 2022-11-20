# frozen_string_literal: true

require 'set'

N, Q = gets.split.map(&:to_i)
queries = $stdin.map { |line| line.split(' ').map(&:to_i) }

set = Set.new

queries.each do |ti, ai, bi|
  case ti
  when 1
    set << [ai, bi]
  when 2
    set.delete([ai, bi])
  when 3
    if set.include?([ai, bi]) && set.include?([bi, ai])
      puts 'Yes'
    else
      puts 'No'
    end
  end
end

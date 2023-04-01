require 'set'

N, X = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

set = Set.new(A)

A.each do |i|
  if set.include?(X + i)
    puts 'Yes'
    exit
  end
end

puts 'No'

require 'set'

N, Q = gets.split.map(&:to_i)
EVENTS = Q.times.map do
  gets.split.map(&:to_i)
end

current = 1
calling = SortedSet.new

EVENTS.each do |type, target|
  case type
  when 1
    calling << current
    current += 1
  when 2
    calling.delete(target)
  when 3
    puts calling.first
  end
end

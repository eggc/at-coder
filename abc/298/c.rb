require 'set'

N = gets.to_i
Q = gets.to_i
queries = Q.times.map { gets.split(' ').map(&:to_i) }

boxes = Array.new(N+1) { [] }
query3_hint = {}

queries.each do |q, i, j|
  case q
  when 1
    query3_hint[i] ||= Set.new
    query3_hint[i] << j
    boxes[j] << i
  when 2
    puts boxes[i].sort!.join(' ')
  when 3
    puts query3_hint[i].to_a.sort.join(' ')
  end
end

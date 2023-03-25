N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

hint = A.map.with_index { |i, j| { value: i, key: 'A', index: j } }
hint.concat(B.map.with_index { |i, j| { value: i, key: 'B', index: j } })
hint.sort_by do |hash|
  hash[:value]
end.each_with_index do |hash, i|
  hash[:sort_number] = i + 1
end

puts hint[0...N].map { |h| h[:sort_number] }.join(' ')
puts hint[N..].map { |h| h[:sort_number] }.join(' ')

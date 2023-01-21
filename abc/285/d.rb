require 'set'

N = gets.to_i
EDGES = $stdin.map { |line| line.chomp.split(' ') }.to_h

def has_loop?(node)
  visited = Set.new
  visited << node

  loop do
    next_node = EDGES[node]

    break if next_node.nil?
    break if OK_GROUP.include?(next_node)

    return false if visited.include?(next_node)

    visited << next_node
    node = next_node
  end

  visited
end

OK_GROUP = Set.new

EDGES.each do |key, _|
  next if OK_GROUP.include?(key)

  no_loop_group = has_loop?(key)

  if no_loop_group
    no_loop_group.each { |node| OK_GROUP << node }
  else
    puts 'No'
    exit
  end
end

puts 'Yes'

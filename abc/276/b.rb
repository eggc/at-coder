N, M = gets.split.map(&:to_i)
roads = $stdin.map { |line| line.chomp.split.map(&:to_i) }

map = Array.new(N+1) { [] }

roads.each do |road|
  city1, city2 = road

  map[city1] << city2
  map[city2] << city1
end

(1..N).each do |i|
  puts("#{map[i].length} #{map[i].sort.join(" ")}")
end

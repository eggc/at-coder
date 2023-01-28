N, M  = gets.split.map(&:to_i)
EDGES = {}
VISITED = Array.new(N+1)
VISITED[0] = true

$stdin.each do |line|
  a, b = line.chomp.split(' ').map(&:to_i)

  EDGES[a] ||= []
  EDGES[a] << b
  EDGES[b] ||= []
  EDGES[b] << a
end

current, _ = EDGES.find { |_k, x| x.length == 1 }
prev = nil

if current.nil?
  puts 'No'
  exit
else
  while current do
    VISITED[current] = true
    edges = EDGES[current]

    if edges.length > 2 || edges.length == 0
      puts 'No'
      exit
    else
      tmp = edges.find { |x| x != prev }
      prev = current
      current = tmp
    end
  end

  if VISITED.all? { |x| x }
    puts 'Yes'
  else
    puts 'No'
  end
end

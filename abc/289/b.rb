N, M = gets.split.map(&:to_i)
A = gets&.split&.map(&:to_i)

@visited = []
@edges = []
@answer = []

A&.each do |i|
  @edges[i] = i+1
end

def re(i)
  @visited[i] = true

  if @edges[i]
    re(i+1)
    @answer << i
  else
    @answer << i
  end
end

1.upto(N) do |i|
  next if @visited[i]

  re(i)
end

puts @answer.join(' ')

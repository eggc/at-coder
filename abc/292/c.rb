N = gets.to_i

@memo = Array.new(N+1, 0)

1.upto(N) do |x|
  1.upto(N/x) do |y|
    z =  x * y

    @memo[x*y] += 1
  end
end

answer = 1.upto(N).sum { |x| @memo[x] * @memo[N-x] }
puts answer

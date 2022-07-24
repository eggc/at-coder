N, Y = gets.split(' ').map(&:to_i)

def find
  (0..N).each  do |x|
    (0..(N-x)).each do |y|
      z = N - x - y

      if x + y + z == N && Y == 10000 * x + 5000 * y + 1000 * z
        return [x, y, z]
      end
    end
  end

  return [-1, -1, -1]
end

puts(find.join(' '))

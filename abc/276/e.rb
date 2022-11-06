H, W = gets.split.map(&:to_i)
MAP = $stdin.map { |line| line.chomp.split('') }
VISITED = H.times.map { Array.new(W) }

def search(i, j)
  return true if ROWS[i][j] == 'S'
  return false if i.negative? || i > H ||
                  j.negative? || j > W ||
                  ROWS[i][j] == '#' ||
                  VISITED[i][j]

  VISITED[i][j] = true

  return search(i + 1, j) ||
         search(i - 1, j) ||
         search(i, j + 1) ||
         search(i, j - 1)
end

# frozen_string_literal: true

H, W = gets.split.map(&:to_i)
S = $stdin.map { |line| line.chomp.split('') }

SNUKE = {
  's' => 'n',
  'n' => 'u',
  'u' => 'k',
  'k' => 'e',
  'e' => 's'
}.freeze

DIFFS = [
  [1, 0],
  [-1, 0],
  [0, 1],
  [0, -1]
].freeze

@visited = Array.new(H) { Array.new(W) }

def search(i, j)
  return true if i == H - 1 && j == W - 1

  next_char = SNUKE[S[i][j]]

  return false if next_char.nil?

  @visited[i][j] = true

  DIFFS.any? do |idiff, jdiff|
    i2 = i + idiff
    j2 = j + jdiff

    next if i2 < 0 || j2 < 0 || i2 >= H || j2 >= W || @visited[i2][j2] || !(S[i2][j2] == next_char)

    search(i2, j2)
  end
end

puts(search(0, 0) ? 'Yes' : 'No')

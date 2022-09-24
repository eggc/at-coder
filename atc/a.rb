# frozen_string_literal: true

H, W = gets.chomp.split(' ').map(&:to_i)
ROWS = H.times.map { gets.chomp.chars }
VISITED = H.times.map { Array.new(W) }

def search(i, j)
  return if i.negative? || i >= H ||
            j.negative? || j >= W ||
            ROWS[i][j] == '#' ||
            VISITED[i][j]

  VISITED[i][j] = true

  ROWS[i][j] == 'g' ||
    search(i + 1, j) ||
    search(i - 1, j) ||
    search(i, j + 1) ||
    search(i, j - 1)
end

H.times do |i|
  W.times do |j|
    return puts 'Yes' if ROWS[i][j] == 's' && search(i, j)
  end
end

puts 'No'

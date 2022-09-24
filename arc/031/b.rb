# frozen_string_literal: true

MAP = 10.times.map { gets.chomp.chars }
VISITED = 10.times.map { Array.new(10) }

LANDS = []

10.times do |i|
  10.times do |j|
    LANDS << [i, j] if MAP[i][j] == 'o'
  end
end

def clear_visited
  10.times do |k|
    10.times do |l|
      VISITED[k][l] = nil
    end
  end
end

def search(i, j)
  return if i.negative? || i >= 10 ||
            j.negative? || j >= 10 ||
            MAP[i][j] == 'x' ||
            VISITED[i][j]

  VISITED[i][j] = true

  search(i + 1, j)
  search(i - 1, j)
  search(i, j + 1)
  search(i, j - 1)
end

def search_entry(i, j)
  VISITED[i][j] = true

  search(i + 1, j)
  search(i - 1, j)
  search(i, j + 1)
  search(i, j - 1)
end

10.times do |i|
  10.times do |j|
    clear_visited
    search_entry(i, j)

    return puts 'YES' if LANDS.all? { |k, l| VISITED[k][l] }
  end
end

puts 'NO'

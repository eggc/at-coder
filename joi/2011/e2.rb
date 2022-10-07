# frozen_string_literal: true

H, W, N = gets.split.map(&:to_i)
MAP = $stdin.map { |line| line.chomp.split('') }

def build_hint_hash
  hash = {}
  numbers = '1'..'9'

  H.times do |i|
    W.times do |j|
      char = MAP[i][j]

      case char
      when numbers, 'S'
        hash[char] = [i, j]
      end
    end
  end

  hash
end

DI = [0, 0, 1, -1].freeze
DJ = [1, -1, 0, 0].freeze

def bfs(start, goal)
  queue = [start]
  steps = H.times.map { Array.new(W) }
  steps[start[0]][start[1]] = 0

  until queue.empty?
    i, j = queue.shift
    step = steps[i][j]

    return step if MAP[i][j] == goal

    4.times do |k|
      i2 = i + DI[k]
      j2 = j + DJ[k]

      next if i2 < 0 ||
              j2 < 0 ||
              i2 >= H ||
              j2 >= W ||
              steps[i2][j2] ||
              MAP[i2][j2] == 'X'

      steps[i2][j2] = step + 1
      queue.push([i2, j2])
    end
  end
end

hint_hash = build_hint_hash
start = 'S'
goal = '1'
answer = 0

loop do
  step = bfs(hint_hash[start], goal)
  answer += step
  start = goal
  goal = goal.next

  if hint_hash[goal].nil?
    puts(answer)
    exit
  end
end

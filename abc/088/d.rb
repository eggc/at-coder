# frozen_string_literal: true

H, W = gets.split.map(&:to_i)

s = $stdin.map { |line| line.chomp.split('') }

def bf_search(map, start_i, start_j, goal_i, goal_j)
  queue = [[start_i, start_j, 0]]
  steps = H.times.map { [] }

  until queue.empty?
    i, j, step = queue.shift

    if (i == goal_i) && (j == goal_j)
      steps[i][j] = step
      return steps
    end

    next if !(0...H).cover?(i) ||
            !(0...W).cover?(j) ||
            steps[i][j] ||
            map[i][j] == '#'

    steps[i][j] = step

    queue.push(
      [i, j + 1, step + 1],
      [i, j - 1, step + 1],
      [i + 1, j, step + 1],
      [i - 1, j, step + 1]
    )
  end

  false
end

steps = bf_search(s, 0, 0, H - 1, W - 1)

unless steps
  puts(-1)
  exit
end
# 0..最終ステップを1回ずつ通過すればいいのでそれ以外は全部塗りつぶしていい
answer = 0
visited = []

H.times do |i|
  W.times do |j|
    case steps[i][j]
    when nil
      answer += 1 if s[i][j] == '.'
    when Integer
      if visited[steps[i][j]]
        answer += 1
      else
        visited[steps[i][j]] = true
      end
    end
  end
end

puts answer

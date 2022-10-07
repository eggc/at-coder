# frozen_string_literal: true

H, W, N = gets.split.map(&:to_i)
MAP = $stdin.map { |line| line.chomp.split('') }

def find(char)
  H.times do |i|
    W.times do |j|
      return [i, j] if MAP[i][j] == char
    end
  end

  nil
end

queue = [[*find('S'), 0]]
goal = '1'
steps = H.times.map { [] }

until queue.empty?
  i, j, step = queue.shift

  next if i < 0 ||
          j < 0 ||
          i >= H ||
          j >= W ||
          steps[i][j] ||
          MAP[i][j] == 'X'

  if MAP[i][j] == goal
    if find(goal.next)
      goal = goal.next
      queue = [[i, j, step]]
      steps = H.times.map { [] }
    else
      puts(step)
      exit
    end
  else
    steps[i][j] = step

    queue.push(
      [i, j + 1, step + 1],
      [i, j - 1, step + 1],
      [i + 1, j, step + 1],
      [i - 1, j, step + 1]
    )
  end
end

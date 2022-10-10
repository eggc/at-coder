# frozen_string_literal: true

N, M = gets.split.map(&:to_i)

# 移動可能な位置の探索
def find_pairs
  pairs = []

  (-N).upto(N) do |k|
    v = M - k * k

    next if v <= 0

    lfloat = Math.sqrt(v)
    l = lfloat.to_i

    if lfloat == l
      pairs << [k, l]
      pairs << [-k, -l]
      pairs << [l, k]
      pairs << [-l, -k]
    end
  end

  pairs.uniq
end

def bf_search(start_i, start_j, diffs)
  queue = [[start_i, start_j]]
  steps = N.times.map { Array.new(N, -1) }
  steps[start_i][start_j] = 0

  until queue.empty?
    i, j = queue.shift

    diffs.each do |k, l|
      i2 = i + k
      j2 = j + l

      next if i2 < 0 ||
              j2 < 0 ||
              i2 >= N ||
              j2 >= N ||
              steps[i2][j2] > -1

      steps[i2][j2] = steps[i][j] + 1

      queue << [i2, j2]
    end
  end

  steps
end

pairs = find_pairs
steps = bf_search(0, 0, pairs)

puts steps.map { |row| row.join(' ') }.join("\n")

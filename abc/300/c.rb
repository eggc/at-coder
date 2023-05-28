# frozen_string_literal: true

H, W = gets.split.map(&:to_i)
C = $stdin.map { |line| line.chomp.split('') }
N = [H, W].min

# a,b を中心としてサイズ n のバッテンであるか？
def check(a, b, d)
  # はみ出てる場合は false にする
  return false if [a - d, b - d].min < 0
  return false if a + d >= H || b + d >= W

  unless C[a + d][b + d] == '#' &&
         C[a + d][b - d] == '#' &&
         C[a - d][b + d] == '#' &&
         C[a - d][b - d] == '#'
    return false
  end

  true
end

counts = Array.new(N, 0)

H.times do |i|
  W.times do |j|
    next unless C[i][j] == '#'

    size = 0

    N.times do |k|
      if check(i, j, k)
        size = k
      else
        break
      end
    end

    if size > 0
      counts[size-1] += 1
    end
  end
end


puts counts.join(" ")

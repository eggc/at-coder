# frozen_string_literal: true

H, W = gets.split.map(&:to_i)
S = $stdin.map { |line| line.chomp.split('') }

def neighbor_cookie_count(i, j)
  count = 0
  count += 1 if i > 0 && S[i - 1][j] == '#'
  count += 1 if j > 0 && S[i][j - 1] == '#'
  count += 1 if j < W - 1 && S[i][j + 1] == '#'
  count += 1 if i < H - 1 && S[i + 1][j] == '#'

  count
end

H.times do |i|
  W.times do |j|
    if S[i][j] == '.' && neighbor_cookie_count(i, j) >= 2
      puts([i + 1, j + 1].join(' '))
      exit
    end
  end
end

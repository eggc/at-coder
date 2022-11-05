# frozen_string_literal: true

S = $stdin.map { |line| line.chomp.split('') }

answer = 0

(1..8).each do |square_size|
  9.times do |i|
    9.times do |j|
      next unless S[i][j] == '#' &&
                  S[i][j + square_size] == '#' &&
                  S[i + square_size][j] == '#' &&
                  S[i + square_size][j + square_size] == '#'

      p [i, j, square_size]

      answer += 1
    end
  end
end

p answer
pp S

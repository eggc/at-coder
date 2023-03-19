# frozen_string_literal: true

require 'set'

H, W = gets.split.map(&:to_i)
A = $stdin.map { |line| line.chomp.split(' ').map(&:to_i) }

k = (H + W - 2)

def search_path(flags)
  current_i = 0
  current_j = 0
  path = Set.new
  path << A[0][0]

  flags.each do |flag|
    if flag
      current_i += 1
    else
      current_j += 1
    end

    return [] if current_i > H - 1 || current_j > W - 1

    path << A[current_i][current_j]
  end

  path
end

puts(
  [true, false].repeated_permutation(k).count do |flags|
    search_path(flags).size == k + 1
  end
)

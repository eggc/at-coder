require 'set'

N, M = gets.split.map(&:to_i)
C = M.times.map do
  gets
  gets.split.map(&:to_i)
end

@checker = (1..N).to_a
@answer = 0
[true, false].repeated_permutation(M).each do |flags|
  set = Set.new

  flags.each_with_index do |flag, i|
    set += C[i] if flag
  end

  if (set & @checker).length == N
    @answer += 1
  end
end

puts @answer

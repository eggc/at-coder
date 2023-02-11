require 'set'

N, M = gets.split.map(&:to_i)
C = M.times.map do
  gets
  gets.split.map(&:to_i).to_set
end

(1..N).to_a.permutation do |numbers|

end

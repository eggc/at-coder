N, M = gets.split.map(&:to_i)
C = M.times.map do
  gets
  gets.split.map(&:to_i)
end

def covered?(selected)
  @checker ||= (1..N).to_a
  (selected & @checker).length == N
end

def search(selected, i)
  p selected

  if i == M-1
    if covered?(selected)
      1
    else
      0
    end
  else
    (C[i+1] - selected).sum do |j|
      search(selected + [j], i+1)
    end
  end
end

puts search([], -1)

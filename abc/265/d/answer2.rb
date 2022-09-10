N, P, Q, R = gets.chomp.split(" ").map(&:to_i)
A = gets.chomp.split(" ").map(&:to_i)



def find(initial_start_index, target)
  # start_index をずらしていく
  initial_start_index.upto(N-1) do |start_index|
    start_index.upto(N-1) do |end_index|
      sequence = [start_index, end_index]
      current = HINT[sequence]
      if current == target
        # 成功
        return sequence
      elsif current > target
        # このスタートインデックスでの探索は失敗
        break
      end
    end
  end

  [nil, nil]
end

def find3
  0.upto(N-1) do |start_index|
    _, a = find(start_index, P)
    _, b = find(a+1, Q) if a
    _, c = find(b+1, R) if b

    if c
      return true
    else
      next
    end
  end

  nil
end


if find3
  puts("Yes")
else
  puts("No")
end

H1, W1 = gets.chomp.split(" ").map(&:to_i)
A = H1.times.map { gets.chomp.split(" ").map(&:to_i) }

H2, W2 = gets.chomp.split(" ").map(&:to_i)
B = H2.times.map { gets.chomp.split(" ").map(&:to_i) }

def match?(hlist, wlist)
  H2.times do |h|
    W2.times do |w|
      unless B[h][w] == A[hlist[h]][wlist[w]]
        return false
      end
    end
  end

  true
end

H1.times.to_a.combination(H2) do |hlist|
  W1.times.to_a.combination(W2) do |wlist|
    next unless match?(hlist, wlist)
    puts 'Yes'
    exit
  end
end

puts 'No'

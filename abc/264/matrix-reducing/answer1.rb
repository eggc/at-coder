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

(2 ** H1).times do |i|
  (2 ** W1).times do |j|
    hlist = H1.times.filter_map { |k| k if i[k] == 1 }
    wlist = W1.times.filter_map { |k| k if j[k] == 1 }

    next unless hlist.length == H2
    next unless wlist.length == W2
    next unless match?(hlist, wlist)

    puts 'Yes'
    exit
  end
end

puts 'No'

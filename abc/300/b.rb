H, W = gets.split.map(&:to_i)

A = H.times.map { gets.chomp.split("") }
B = H.times.map { gets.chomp.split("") }

def check(id, jd)
  H.times do |i|
    W.times do |j|
      # p([i,j])
      ix = (i + id) % H
      jx = (j + jd) % W

      # p([ix,jx,A[ix][jx],i,j,B[i][j]])

      if A[ix][jx] != B[i][j]
        return false
      end
    end
  end

  true
end

H.times do |i|
  W.times do |j|
    if check(i, j)
      puts "Yes"
      exit
    end
  end
end

puts "No"

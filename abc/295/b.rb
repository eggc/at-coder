R, C = gets.split.map(&:to_i)
B = $stdin.map { |line| line.chomp.split('') }

R.times do |i|
  C.times do |j|
    power = B[i][j].to_i

    next if power == 0

    (-power).upto(power) do |id|
      (-power).upto(power) do |jd|
        if power >= id.abs + jd.abs
          if B.dig(i-id, j-jd) == '#' && i-id >= 0 && j-jd >= 0
            B[i-id][j-jd] = '.'
          end
        end
      end
    end
  end
end

R.times do |i|
  C.times do |j|
    if B[i][j] != '#'
      B[i][j] = '.'
    end
  end
end

puts B.map { |x| x.join }.join("\n")

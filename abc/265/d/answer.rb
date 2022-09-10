N, P, Q, R = gets.chomp.split(" ").map(&:to_i)
A = gets.chomp.split(" ").map(&:to_i)

S = [0]
N.times.map { |i| S[i+1] = S[i] + A[i] }

puts "P: #{P}" if ENV['DEBUG']
puts "Q: #{Q}" if ENV['DEBUG']
puts "R: #{R}" if ENV['DEBUG']
puts "A: #{A.join(" ")}" if ENV['DEBUG']
puts "S: #{S.join(" ")}" if ENV['DEBUG']

N.times.each do |x|
  y = S.bsearch_index { |k| P + S[x] - k }

  puts "x = #{x} y = #{y}" if ENV['DEBUG']

  if y
    z = S.bsearch_index { |k| Q + S[y] - k }

    if z
      w = S.bsearch_index { |k| R + S[z] - k }

      if w
        puts "x = #{x} y = #{y} z = #{z} w = #{w}" if ENV['DEBUG']
        return puts("Yes")
      end
    end
  end
end

puts("No")

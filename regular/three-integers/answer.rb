A, B, C = gets.split(" ").map(&:to_i).sort

if C <= A + B
  puts(C)
else
  puts(-1)
end

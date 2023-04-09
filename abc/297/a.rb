N, D = gets.split.map(&:to_i)
T = gets.split.map(&:to_i)

1.upto(N-1) do |i|
  if T[i] - T[i-1] <= D
    puts T[i]
    exit
  end
end

puts -1

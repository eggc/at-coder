N, M, T = gets.chomp.split(" ").map(&:to_i)
A = gets.chomp.split(" ").map(&:to_i)
BONUS_ROOMS = {}

M.times do
  x, y = gets.chomp.split(" ").map(&:to_i)
  BONUS_ROOMS[x-2] = y
end

current = T

(N-1).times do |step|
  current -= A[step]

  if current <= 0
    puts("No")
    exit
  elsif BONUS_ROOMS[step]
    current += BONUS_ROOMS[step]
  end
end

puts("Yes")

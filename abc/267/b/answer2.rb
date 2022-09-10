S = gets.chomp.split("").map { |i| i == "1" }
S.unshift(-1)

LINES = [
  S[7],
  S[4],
  S[8] || S[2],
  S[5] || S[1],
  S[9] || S[3],
  S[6],
  S[10]
]

K = LINES.length

if S[1]
  puts("No")
  exit
end

K.times do |i|
  K.times do |j|
    if LINES[i] && LINES[j] && !LINES[i..j].all?
      puts("Yes")
      exit
    end
  end
end

puts("No")

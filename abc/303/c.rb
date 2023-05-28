N, M, H, K = gets.split.map(&:to_i)
S = gets.chomp
ITEMS = {}

$stdin.map do |line|
  pos = line.chomp.split(' ').map(&:to_i)
  ITEMS[pos] = true
end

current = [0, 0]
health = H

S.each_char do |char|
  # p [current, char, health]

  case char
  when 'R'
    current[0] += 1
  when 'L'
    current[0] -= 1
  when 'U'
    current[1] += 1
  when 'D'
    current[1] -= 1
  end

  health -= 1

  if health < 0
    puts 'No'
    exit
  elsif ITEMS[current] && health < K
    health = K
    ITEMS[current] = nil
  end
end

puts 'Yes'

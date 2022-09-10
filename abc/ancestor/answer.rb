N = gets.to_i
PEOPLE = gets.split(' ').map(&:to_i)

# 最後は絶対1が親になってるので1から始める
count = 1

# 人数はN人だけど先祖情報は N-1個しかなくてしかも0から始まるので-2
current = N-2

loop do
  if PEOPLE[current] == 1
    break
  elsif PEOPLE[current] > 1
    count += 1
    current = PEOPLE[current] - 2
  end
end

puts(count)

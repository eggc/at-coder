S = gets.chomp.split("")

numbers = S.map do |c|
  case c
  when 'a' then 1
  when 't' then 2
  when 'c' then 3
  when 'o' then 4
  when 'd' then 5
  when 'e' then 6
  when 'r' then 7
  end
end

step = 0

SORTED = [1,2,3,4,5,6,7]

loop do
  6.times do |i|
    if numbers[i] > numbers[i+1]
      step += 1

      tmp = numbers[i+1]
      numbers[i+1] = numbers[i]
      numbers[i] = tmp
    end
  end

  break if numbers == SORTED
end

puts(step)

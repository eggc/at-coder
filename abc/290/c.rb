N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

list = A.sort.uniq.first(K)

if list[0] != 0
  puts '0'
  exit
end

list.each_index do |i|
  # 連続であること
  if list[i]+1 == list[i+1]
    next
  else
    puts i + 1
    exit
  end
end

puts list.length

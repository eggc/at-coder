LIST = gets.chomp.split(" ").map(&:to_i)

puts(LIST.uniq.count)

S = gets

index = S.chars.rindex {|x| x == "a" }

puts(index ? index + 1 : -1)

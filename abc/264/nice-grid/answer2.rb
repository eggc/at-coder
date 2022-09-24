R,C = gets.split(" ").map(&:to_i)

answer = [(R-8).abs, (C-8).abs].max

puts(answer.even? ? 'white' : 'black')

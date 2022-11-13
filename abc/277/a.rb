N, X = gets.split.map(&:to_i)
P = gets.split.map(&:to_i)

P.each_with_index do |value, i|
  if value == X
    puts i+1
    exit
  end
end

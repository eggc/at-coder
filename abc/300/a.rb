N, A, B = gets.split.map(&:to_i)
C = gets.split.map(&:to_i)

C.each_with_index do |c, i|
  if A + B == c
    puts i+1
    exit
  end
end
